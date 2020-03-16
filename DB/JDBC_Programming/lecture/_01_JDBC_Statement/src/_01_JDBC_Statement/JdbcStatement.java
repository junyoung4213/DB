package _01_JDBC_Statement;

import java.sql.*;

/*
 * 1. ojdbcX.jar �� �����Ѵ�(Add Externals Libraries)
 * 2. import java.sql.*;
 * 3. ����Ŭ ����̹� ��ü�� �ε��Ѵ�
 * 4. Connection ��ü�� �����Ѵ�(����Ŭ ���ӿ뵵)
 * 5. Statement ��ü�� �����Ѵ�(����Ŭ�� Query�� ����)
 * 6. Query�� ����� �ִٸ� (SELECT�� ����)
 * 	  ResultSet ��ü�� �����Ѵ�(������ ��� ���尴ü)
 * 7. ResultSet -> Statement -> Connection ������
 * 	  (��, Open�� ��������) Close()�Ѵ�.
*/

public class JdbcStatement {
	/*
	 * static �ʱ�ȭ ���� ���� ���� ȣ��Ǵ� ���� static �ʵ带 �ʱ�ȭ�ϴ� ��
	 */
	static {
		// 1) ����Ŭ ����̹� ��ü�� �ε��Ѵ�
		/*
		 * DriverManager ���ο��� ����� Oracle ����̹� ��ü�� �����ؼ� �޸𸮿� �ε��� 
		 * ���α׷����� ���� ������ ���� �����Ƿ� Ŭ���� ������ �������� �ʾҴ�.
		 */
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		Connection con = null; // ����Ŭ ���ӿ뵵
		Statement stmt = null; // SQL�� ����뵵
		ResultSet rs = null; // SELECT�� ��� �޴� �뵵

		try {
			// 2) Connection ��ü�� �����Ѵ�
			// 	    ����Ŭ�� �����Ѵ�
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"bitcamp", 
					"bitcamp");
			
			// 3) Statement ��ü�� �����Ѵ�
			stmt = con.createStatement();
			StringBuffer sb = new StringBuffer();
			int updateCount = 0;
			
			// 4) ���α׷��� ������ �����ϱ� ���� test1���̺��� ������
			// �����϶�� ����
			try {
				sb.setLength(0); // ���ο� ���ڿ� ���� ��
				sb.append("DROP TABLE test1");
				stmt.executeUpdate(sb.toString());
				System.out.println(sb.toString());
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			
			// 5) test1 ���̺� ����
			sb.setLength(0);
			sb.append("CREATE TABLE test1(" +
					  "id VARCHAR2(10), "
					  + "age NUMBER)");
			//executeUpdate�� ���ϰ�
			//DML(INSERT, UPDATE, DELETE) : ����� ���� ����
			//DDL(CREATE, DROP) : 0, ����� ���� ������ ����
			updateCount = stmt.executeUpdate(sb.toString());
			System.out.println(sb.toString());
			System.out.println("createCount: " + updateCount);
			
			// 6) ������ �Է�
			   sb.setLength(0);
			   sb.append("INSERT INTO test1 ");
			   sb.append("VALUES ('aaa000'");
			   sb.append(",10)");
			   updateCount = stmt.executeUpdate(sb.toString());
			   System.out.println("INSERT COUNT : " + updateCount);
			   
			// 7) ������ �˻�
			   sb.setLength(0);
			   sb.append("SELECT * FROM test1");
			   System.out.println(sb.toString());
			   rs = stmt.executeQuery(sb.toString());
			   while(rs.next()) {
				   System.out.print("id: " + rs.getString(1) + ", ");
				   System.out.println("age: " + rs.getString(2));
			   }
			   
			// 8) Update�� �ϱ�
			   sb.setLength(0);
			   sb.append("UPDATE test1 SET id='bbb000', ");
			   sb.append("age=20 ");
			   sb.append("WHERE id='aaa000'");
			   updateCount = stmt.executeUpdate(sb.toString());
			   System.out.println(sb.toString());
			   System.out.println("UPDATE COUNT : " + updateCount);
			   
			// 9) ������ �˻�
			   sb.setLength(0);
			   sb.append("SELECT * FROM test1");
			   System.out.println(sb.toString());
			   rs = stmt.executeQuery(sb.toString());
			   while(rs.next()) {
				   System.out.print("id: " + rs.getString(1) + ", ");
				   System.out.println("age: " + rs.getString(2));
			   }
			   
			// 10) �����ϱ�
			   sb.setLength(0);
			   sb.append("DELETE FROM test1");
			   updateCount = stmt.executeUpdate(sb.toString());
			   System.out.println(sb.toString());
			   System.out.println("DELETE COUNT : " + updateCount);
			   
			// 11) ������ �˻�
			   sb.setLength(0);
			   sb.append("SELECT * FROM test1");
			   System.out.println(sb.toString());
			   rs = stmt.executeQuery(sb.toString());
			   while(rs.next()) {
				   System.out.print("id: " + rs.getString(1) + ", ");
				   System.out.println("age: " + rs.getString(2));
			   }
			      
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}