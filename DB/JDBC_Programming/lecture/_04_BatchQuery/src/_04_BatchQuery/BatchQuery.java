package _04_BatchQuery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
executeUpdate : DML(INSERT, UPDATE, DELETE)
executeQuery : SELECT
���� ����ڷκ��� ���� Query�� �Է¹��� ����
� ������ �������� �� ���� ����.
�̷� ���� execute�� ����Ѵ�
��ȯ���� true�� SELECT��
false�� DDL, DML��
String sql = sc.next();
if(stmt.execute(sql)){
	rs = stmt.getResultSet(); // SELECT��
}else{
	uCount = stmt.getUpdateCount(); // � �� ����
}
*/
public class BatchQuery {
	static {
		// 1) ��Ű�� Ŭ���� ��θ� ���ڿ� �����ؼ� ��ü ����
		// Class.forName("oracle.jdbc.driver.OracleDriver");
		try {
//			oracle.jdbc.driver.OracleDriver oraDriver = 
//					new oracle.jdbc.driver.OracleDriver();
//			DriverManager.registerDriver(oraDriver);
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// 2) ��ü ���� ����
		Connection con = null; // ����Ŭ ���� ����
		Statement stmt = null; // Query�� ����
		ResultSet rs = null; // SELECT�� ���
		boolean isCommit = false; // Ʈ����� �Ϸ�/�̿Ϸ�

		try {
			// 3) ����Ŭ ���� ����
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bitcamp", "bitcamp");

			if (con != null) {
				System.out.println("Oracle Server ���� ����!");
			}

			// 4) Query�� ���� ��ü ����
			stmt = con.createStatement();

			// 5) ���� test4���̺��� �ִٸ� ����
			try {
				stmt.executeUpdate("DROP TABLE test4");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

			// 6) test4���̺��� ����
			stmt.executeUpdate("CREATE TABLE test4(" + "id VARCHAR2(10)," + "password VARCHAR2(10))");

			// 7) ���� ���� ������ ��Ƽ� �ѹ��� �����Ѵ�
			// ��ġ ����
			// ���� JDBC�� �⺻������ �ڵ� Ŀ���̴�.
			// ��ġ ������ �ϱ� ���ؼ� ���� Ŀ������ �����Ѵ�.

			/*
			 * JDBC�� DML������ ������ �� �ڵ����� Ŀ���Ѵ� �׷��� ��ġ�������� �Ϸ��� ������ ������ ��� ����Ǿ�� �ϴ� ���, ���� �߰�����
			 * ������ �߻��ϸ� ����� �κб��� �̹� Ŀ�� ó���� �Ǳ� ������ Rollback�� ���� ���ؼ� ������ �߻��� �� �ִ�. �̷� ���� ����
			 * Ʈ������� �Ϸ�� �������� Ŀ���� ó���ϴ� ���� �ٶ����ϴ�.
			 */
			con.setAutoCommit(false);

			// Query������ ��´�.
//			stmt.addBatch("INSERT INTO test4 " +
//						  "VALUES('aaa000', '0000')");
			stmt.addBatch("INSERT INTO test4" + "\r\n" + "VALUES('aaa000', '0000')");
			stmt.addBatch("INSERT INTO test4" + "\r\n" + "VALUES('bbb111', '1111')");
			stmt.addBatch("INSERT INTO test4" + "\r\n" + "VALUES('ccc222', '2222')");
			stmt.addBatch("INSERT INTO test4" + "\r\n" + "VALUES('ddd333', '3333')");

			// Oracle Server�� �ѹ��� ����

			try {
				int[] uCounts = stmt.executeBatch();
				for (int i = 0; i < uCounts.length; i++) {
					System.out.println(i + 1 + "��° Query " + uCounts[i] + "�� ����");
				}
			} catch (SQLException e) {
				con.rollback();
				e.printStackTrace();
			}
			
			con.commit();
			isCommit = true;
			con.setAutoCommit(true); // ���� �ڵ�Ŀ������ ������

			rs = stmt.executeQuery("SELECT * FROM test4");
			while (rs.next()) {
				String id = rs.getString("id");
				String password = rs.getString("password");
				System.out.println("id: " + id + ", " + "password: " + password);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}