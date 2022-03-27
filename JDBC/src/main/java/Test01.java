import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Test01 {

	public static void main(String[] args) {

//		String classPath = "java.lang.Object";
//		
//		try {
//			Object ob = Class.forName(classPath).newInstance();
//			System.out.println(ob);
//		} catch (InstantiationException e) {
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
		
		
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
		String user = "jsp01";
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
		System.out.print("이름 입력: ");
		String name = sc.next();
		System.out.print("나이 입력: ");
		int age = sc.nextInt();
		System.out.print("키 입력: ");
		double height = sc.nextDouble();
		
		sc.close();
		
		
		// statement
//		Statement stmt = null;
//		
//		String sql = "insert into dbtest values('" + name + "'," + age + "," + height + ",sysdate)";
//		
//		try {
//			stmt = con.createStatement();
//			int su = stmt.executeUpdate(sql);
//			if(su != 0) {
//				System.out.println("입력 성공!");
//			}else {
//				System.out.println("입력 실패!");
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(stmt != null) {
//					stmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			}catch(SQLException e) {
//				e.printStackTrace();
//			}
//		}
		
		
		// PreparedStatement
		PreparedStatement ps = null;
		
		String sql = "insert into dbtest values(?,?,?,sysdate)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, age);
			ps.setDouble(3, height);
			int su = ps.executeUpdate();
			if(su != 0) {
				System.out.println("입력 성공!");
			}else {
				System.out.println("입력 실패!");
			}
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
	}
}
