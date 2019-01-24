package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CookingDAO {

	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = null;
	int cnt = 0;

	public void getConnection() {
		String url = "jdbc:oracle:thin:@168.131.22.73:1521:xe";
		String user = "system";
		String password = "12345";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		if (pst != null) {
			try {
				pst.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int insertCookingInfo(String name, String calorie, String protein) {
		sql = "insert into cooking values(num.nextval, ?, ?, ?)";

		try {
			getConnection();

			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setFloat(2, Float.parseFloat(calorie));
			pst.setFloat(3, Float.parseFloat(protein));

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println(name + " " + calorie + " " + protein);
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}
	//칼로리 계산
	   public String[] searchCookingInfo(String Cookname) {
	     
	      String[] CookingArr = new String[3];
	      
	     

	      sql = "select * from cooking where cooking_name =?";

	      try {
	    	  getConnection();
	         pst = conn.prepareStatement(sql);
	         pst.setString(1, Cookname);

	         rs = pst.executeQuery();

	         while (rs.next()) {
	            CookingArr[0] = rs.getString(2); //음식이름
	            CookingArr[1] = rs.getString(3); // 칼로리
	            CookingArr[2] = rs.getString(4); // 단백질
	           
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }

	      return CookingArr;

	   }

}
