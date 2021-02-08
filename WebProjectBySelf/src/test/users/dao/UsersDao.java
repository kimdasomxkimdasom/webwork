package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	//Singleton Dao
	//static 필드 선언
	private static UsersDao dao;
	//외부에서 객체 생성 불가하도록
	private UsersDao() {}
	//Dao 참조값을 리턴해주는 static메소드
	public static UsersDao getInstance() {
		if(dao==null) { //최초 호출 되는 경우
			dao=new UsersDao(); //객체를 생성해서 참조값을 static필드에 저장
		}
		//static필드에 저장된 참조값을 리턴
		return dao;
	}
	
	//아이디에 해당되는 회원가입정보를 리턴해주는 메소드
	public UsersDto getDate(String id) {
		//회원정보를 담을 
		UsersDto dto=null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "Select pwd,email,profile,regdate"
					+ " From users"
					+ " Where id=?";
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할 게 있으면 여기서 바인딩한다.
			pstmt.setString(1, id);
			//select문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			//while문 혹은 if문에서 ResultSet으로 부터 data추출
			if (rs.next()) {
				dto=new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
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
	
	//비밀번호를 수정하는 메소드
	public boolean pwdUpdate(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert문 구성
			String sql = "Update users"
					+ " Set pwd=?"
					+ " Where id=? And pwd=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setString(1, dto.getNewPwd()); //new비밀번호
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
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
	
	//회원정보를 수정하는 메소드
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert문 구성
			String sql = "Update users"
					+ " Set email=?"
					+ " Where id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getId());
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
	
	//회원정보를 삭제하는 메소드
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 delete문 구성
			String sql = "Delete From users"
					+ " Where id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setString(1, id);
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
	
	//회원가입 정보 select (id/pwd 유효성 여부 검사)
	public boolean isValid(UsersDto dto) {
		//id pwd가 유효한 정보인지 여부를 담을 지역변수 선언하기
		boolean isValid=false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "Select id"
					+ " From users"
					+ " Where id=? And pwd=?";
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩 할 게 있으면 여기서 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select문 수행하고 ResultSet 받아오기
			rs = pstmt.executeQuery();
			
			//while문 혹은 if문에서 ResultSet으로 부터 data추출
			if (rs.next()) { //만일 select된 row가 있다면
				//유효한 정보 이므로 isValid에 true를 대입한다.
				isValid=true;
			}//없다면 false로 retrun
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
		//아이디가 유효한지 여부를 리턴해준다.
		return isValid;
	}
	
	//회원가입 정보 추가하는 메소드
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 insert문 구성
			String sql = "Insert Into users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩할 내용이 있으면 바인딩을 한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
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
