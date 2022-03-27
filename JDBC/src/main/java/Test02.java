import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Test02 {

	public static void main(String[] args) {
		
		// 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공!");
		} catch (ClassNotFoundException e) {
			System.err.println("드라이버 로딩 실패!");
			e.printStackTrace();
		}
		
		
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
		
		Scanner sc = new Scanner(System.in);
		System.out.print("수정할 이름 입력: ");
		String name = sc.next();
		System.out.print("나이 입력: ");
		int age = sc.nextInt();
		System.out.print("키 입력: ");
		double height = sc.nextDouble();
		
		sc.close();
		
		//statement
//		Statement stmt = null;
//		
//		String sql = String.format("update dbtest set age=%d, height=%f where name='%s'", age, height, name);
//		try {
//			stmt = con.createStatement();
//			int su = stmt.executeUpdate(sql);
//			if(su != 0) {
//				System.out.println("수정 성공");
//			}else {
//				System.out.println("수정 실패");
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(stmt != null) stmt.close();
//				if(con != null) con.close();
//			}catch(SQLException e){
//				e.printStackTrace();
//			}
//		}
		
		//preparedStatement
		
		PreparedStatement ps = null;
		
		String sql = "update dbtest set age=?, height=? where name=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, age);
			ps.setDouble(2, height);
			ps.setString(3, name);
			int su = ps.executeUpdate();
			if(su != 0) {
				System.out.println("수정 완료");
			}else {
				System.out.println("수정 실패");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
