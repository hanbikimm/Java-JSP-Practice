package student.studentdao;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import student.studentdto.StudentDTO;

public class StudentDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//singleton 패턴
	//프로그램에서 인스턴스 공간을 하나만 만들어 놓고 가져다 사용할수 있도록 만드는 프로그램 방식
	
	private static StudentDAO instance /* = new StudentDAO() */;
	
	private StudentDAO() {
		
	}
	
	public static StudentDAO getInstance() {
		if(instance == null) {
			instance = new StudentDAO();
		}
		return instance;
	}
	
	///DataSource 설정
	private static DataSource ds;

	static {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			//java:comp/env/ - Tomcat서버 사용시 설정을 불러올때 사용하는 경로
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
//	public StudentDAO() {
//		try {
//			Class.forName("oracle.jdbc.OracleDriver");
//		}catch(ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public void getConnection() {
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user = "jsp01";
//		String password = "oracle";
//		
//		try {
//			con = DriverManager.getConnection(url, user, password);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//	}
	
	public boolean insert(StudentDTO dto) {
		boolean check = false;
		
		String sql = "insert into student values(?,?,?)";
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getValue());
			ps.setInt(3, dto.getCode());
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return check;
	}
	
	public int delete(String name) {
		int su = 0;
		
		String sql = "delete student where name = ?";
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			su = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!= null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return su;
	}
	
	public int update(StudentDTO dto) {
		int su = 0;
		
		String sql = "update student set value=?,code=? where name=?";
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getValue());
			ps.setInt(2, dto.getCode());
			ps.setString(3, dto.getName());
			su = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!= null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return su;
	}
	
	public StudentDTO selectOne(String name) {
		
		String sql = "select * from student where name=?";
		
		StudentDTO dto = null;
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new StudentDTO();
				dto.setName(rs.getString("name"));
				dto.setValue(rs.getString("value"));
				dto.setCode(rs.getInt("code"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!= null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	

	public List<StudentDTO> select(StudentDTO dto) {
		
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		
		String sql = null;
		
		if(dto == null) {
			sql = "select * from student";
		}else if(dto.getName() != null) {
			sql = "select * from student where name like ?";
		}else {
			sql = "select * from student where code = ?";
		}
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			if(dto != null) {
				if(dto.getName() != null) {
					ps.setString(1, "%" + dto.getName() + "%");
				}else {
					ps.setInt(1, dto.getCode());
				}
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String value = rs.getString("value");
				int code = rs.getInt("code");
				
				StudentDTO dt = new StudentDTO(name, value, code);
				
				list.add(dt);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	
	
	//전체 검색
	public List<StudentDTO> select() {
		
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		
		String sql = null;
		sql = "select * from student";
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String value = rs.getString("value");
				int code = rs.getInt("code");
				
				StudentDTO dt = new StudentDTO(name, value, code);
				
				list.add(dt);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	
	//이름 검색
	public List<StudentDTO> select(String sname) {
		
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		
		String sql = null;
		
			sql = "select * from student where name like ?";
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + sname + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String value = rs.getString("value");
				int code = rs.getInt("code");
				
				StudentDTO dt = new StudentDTO(name, value, code);
				
				list.add(dt);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	
	//코드 검색
	public List<StudentDTO> select(int scode) {
		
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		
		String sql = "select * from student where code = ?";
		
		try {
			//this.getConnection();
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, scode);
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String value = rs.getString("value");
				int code = rs.getInt("code");
				
				StudentDTO dt = new StudentDTO(name, value, code);
				
				list.add(dt);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
}




















