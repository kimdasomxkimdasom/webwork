package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;
/*
 * 	application 전역에 대해서 Dao객체는 오직 한번만 생성되는 구조로 바꾸어야한다.
 * 
 * 	웹 어플리케이션은 여러 client의 요청을 빠르게 처리 해야하기 때문에 
 * 	
 * 	불필요한 dao의 중복 생성은 웹 어플리케이션의 성능에 영향을 주기 때문이다.
 */
public class TodoDao {
	//1. 자신의 객체를 담을 static 필드 선언
	private static TodoDao dao;
	//2. 외부에서 객체 생성이 불가 하도록 생성자의 접근 지정자를 private로
	private TodoDao() {}
	//3. 자신의 참조값을 리턴해주는 public static 메소드 정의
	public static TodoDao getInstance() {
		if(dao==null) { //getInstance()메소드가 최초 호출되는 경우
			dao=new TodoDao(); //객체를 생성해서 참조값을 static 필드에 저장한다.
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
					+ " FROM todo";
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
		
	//할일 목록을 리턴해주는 메소드
	public List<TodoDto> getList(TodoDto dto){
		//리턴해줄 ArrayList 객체 생성
		List<TodoDto> list=new ArrayList<TodoDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * " + 
					"		FROM" + 
					"			(SELECT result1.*,ROWNUM AS rnum" + 
					"			FROM" + 
					"				(SELECT num,content,regdate" + 
					"				FROM todo" + 
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
				//TodoDto객체를 생성해서
				dto=new TodoDto();
				//select된 ResultSet에 담긴 내용을 담고
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				//ArrayList객체에 누적시킨다.
				list.add(dto);
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
	
	//할 일 한개를 리턴하는 메소드 (select)
	public TodoDto getData(int num) {
		//TodoDto객체를 담을 지역변수 미리 만들기
		TodoDto dto=null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "Select content, regdate" 
					+ " From todo"
					+ " Where num=?";
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할 게 있으면 여기서 바인딩한다.
			pstmt.setInt(1, num);
			//select문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data추출
			if (rs.next()) {
				dto=new TodoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setContent(rs.getString("regdate"));
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
	
	//할일 추가해주는 메소드 (insert)
		public boolean insert(TodoDto dto) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 insert문 구성
				String sql = "INSERT INTO todo"
						+ " (num,content,regdate)"
						+ " VALUES(todo_seq.NEXTVAL, ? , SYSDATE)";
				pstmt = conn.prepareStatement(sql);
				//?에 바인딩할 내용이 있으면 바인딩을 한다.
				pstmt.setString(1, dto.getContent());
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
		
	//할일을 수정하는 메소드 (update)
		public boolean update(TodoDto dto) {

			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 insert문 구성
				String sql = "Update todo"
						+ " Set content=?, regdate=SYSDATE" //수정한 시점으로 수정
						+ " Where num=?";
				pstmt = conn.prepareStatement(sql);
				//?에 바인딩할 내용이 있으면 바인딩을 한다.
				pstmt.setString(1, dto.getContent());
				pstmt.setInt(2, dto.getNum());
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
	
	//할일 삭제해주는 메소드(delete)
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 delete문 구성
			String sql = "Delete from todo Where num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setInt(1, num);
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
