package test.member.dao;
/*
 * insert update delete 
 * getData getList 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dao.TodoDao;
import test.util.DbcpBean;

public class MemberDao {
	
	//1. 자신의 객체를 담을 static 필드 선언
	private static MemberDao dao;
	//2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private로
	private MemberDao() {}
	//3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	public static MemberDao getInstance() {
		if(dao==null) { //getInstance()메소드가 최초 호출되는 경우
			dao=new MemberDao(); //객체를 생성해서 참조값을 static 필드에 저장한다.
		}
		//static 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}
	
	//전체 row의 갯수를 리턴하는 메소드
	public int getCount() {
		int count=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT NVL(MAX(ROWNUM),0) AS num"
					+ " FROM member";
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할 게 있으면 여기서 바인딩한다.

			//select문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data추출
			//row 1개니까 if문 사용
			if (rs.next()) {
				count=rs.getInt("num"); //칼럼명을 적어야하니까 별칭을 하는게 좋다
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return count;
	}
	
	/*
	  	-- 1.정렬
		-- 2.행번호 부여 (하고 AS이용 해서 별칭 붙이기)
		-- 3.보여줄 페이지에 해당하는 행만 select하기
		
		SELECT *
		FROM
			(SELECT result1.*,ROWNUM AS rnum
			FROM
				(SELECT num,name,addr
				FROM member
				ORDER BY num DESC) result1)
		WHERE rnum BETWEEN ? and ?
	 */
	
	//회원 목록을 리턴해주는 메소드
		public List<MemberDto> getList(MemberDto dto){
			//리턴해줄 ArrayList 객체 생성
			List<MemberDto> list=new ArrayList<MemberDto>();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT * " + 
						"		FROM" + 
						"			(SELECT result1.*,ROWNUM AS rnum" + 
						"			FROM" + 
						"				(SELECT num,name,addr" + 
						"				FROM member" + 
						"				ORDER BY num DESC) result1)" + 
						"		WHERE rnum BETWEEN ? AND ?";
				pstmt = conn.prepareStatement(sql);
				//?에 바인딩 할게 있으면 여기서 한다
				pstmt.setInt(1, dto.getStartRowNum());
				pstmt.setInt(2, dto.getEndRowNum());
				//select문 수행하고 ResultSet 받아오기
				rs = pstmt.executeQuery();
				//while문 혹은 if문에서 ResultSet으로 부터 data추출
				while (rs.next()) {
					//MemberDto 객체를 생성해서 회원 한명의 정보를 담아서
					MemberDto tmp=new MemberDto(); //dto명이 중복되어서 tmp로 변경
					tmp.setNum(rs.getInt("num"));
					tmp.setName(rs.getString("name"));
					tmp.setAddr(rs.getString("addr"));
					//ArrayList에 누적 시킨다.
					list.add(tmp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {

				}
			}
			return list;
		}
	
	//회원 한명의 정보를 리턴하는 메소드 (select)
	public MemberDto getData(int num) {
		MemberDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT name,addr"
					+ " FROM member"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할 게 있으면 여기서 바인딩한다.
			pstmt.setInt(1, num);
			//select문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data추출
			if (rs.next()) {
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return dto;
	}
	
	//회원 한명의 정보를 수정하는 메소드 (update)
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			
			//실행할 update문 구성
			String sql = "UPDATE member"
					+ " SET name=?,addr=? "
					+ " WHERE num=? ";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			
			//sql문 실행하고 변화된 row갯수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	
	}
	
	//회원 한명의 정보를 추가하는 메소드(insert)
	public boolean insert(MemberDto dto) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert문 구성
			String sql="INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			//sql문 실행하고 변화된 row갯수 리턴 받기
			flag=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//회원 한명의 정보를 삭제하는 메소드(delete)
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert문 구성
			String sql = "DELETE FROM member WHERE num=?"; 
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setInt(1,num);
			//sql문 실행하고 변화된 row갯수 리턴 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

}
