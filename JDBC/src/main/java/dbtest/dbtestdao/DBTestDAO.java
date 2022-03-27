package dbtest.dbtestdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dbtest.dbtestdto.DBTestDTO;

public class DBTestDAO {

	public DBTestDAO() {
		// 드라이버 로딩은 한 번만 실행되면 되니까 생성자의 위치로 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공!");
		} catch (ClassNotFoundException e) {
			System.err.println("드라이버 로딩 실패!");
			e.printStackTrace();
		}
	}
	
	//connection은 수정 삭제 등록 계속 사용해야 하니까 메서드로 뺴놓고 사용하는 것이 좋음 
	private Connection getConnection() {
		// connection 객체 생성 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##jsp01";
		String password = "oracle";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			System.out.println("연결 성공!");
		} catch (SQLException e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		}
		
		return con;
	}
	
	public int insert(DBTestDTO dto) {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "insert into dbtest values(?,?,?,sysdate)";
		
		int su = 0;
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setInt(2, dto.getAge());
			ps.setDouble(3, dto.getHeight());
			su = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(con != null) {
					con.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return su;
	}
}
