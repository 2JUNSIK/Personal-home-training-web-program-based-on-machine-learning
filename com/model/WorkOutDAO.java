package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class WorkOutDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = null;
	int cnt = 0;
	
	public void getConnection() {
		String url = "jdbc:oracle:thin:@168.131.22.72:1521:xe";
		String user = "test";
		String password = "1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
			if (conn != null) {
				System.out.println("DB success");
			} else {
				System.out.println("DB failure");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<WorkOutDTO> pushupList() {
		ArrayList<WorkOutDTO> arr = new ArrayList<>();
		getConnection();
		String sql = "select * from workoutroutine where workoutclass = '1'";
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				if (rs.getString(2).equals("버피테스트") || rs.getString(2).equals("팔 벌려 뛰기") || rs.getString(2).equals("플랭크")) {
					
				} else {
					WorkOutDTO dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3)
							,rs.getInt(4),rs.getString(5));
					arr.add(dto);
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}
	
	public ArrayList<WorkOutDTO> chocoList() {
		ArrayList<WorkOutDTO> arr = new ArrayList<>();
		getConnection();
		String sql = "select * from workoutroutine where workoutclass = '4'";
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				if (rs.getString(2).equals("버피테스트") || rs.getString(2).equals("팔 벌려 뛰기")) {
					
				} else {
					WorkOutDTO dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3)
							,rs.getInt(4),rs.getString(5));
					arr.add(dto);
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}
	
	
	public ArrayList<WorkOutDTO> legList() {
		ArrayList<WorkOutDTO> arr = new ArrayList<>();
		getConnection();
		String sql = "select * from workoutroutine where workoutclass = '2'";
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				if (rs.getString(2).equals("버피테스트") || rs.getString(2).equals("팔 벌려 뛰기") || rs.getString(2).equals("플랭크")) {
					
				} else {
					WorkOutDTO dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3)
							,rs.getInt(4),rs.getString(5));
					arr.add(dto);
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}
	
	public ArrayList<WorkOutDTO> shou_backList() {
		ArrayList<WorkOutDTO> arr = new ArrayList<>();
		getConnection();
		String sql = "select * from workoutroutine where workoutclass = '5'";
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				if (rs.getString(2).equals("버피테스트") || rs.getString(2).equals("팔 벌려 뛰기") || rs.getString(2).equals("플랭크")) {
					
				} else {
					WorkOutDTO dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3)
							,rs.getInt(4),rs.getString(5));
					arr.add(dto);
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}
	public ArrayList<WorkOutDTO> AllWorkOutList() {
		ArrayList<WorkOutDTO> arr = new ArrayList<>();
		getConnection();
		String sql = "select * from workoutroutine";
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()) {
				if (rs.getString(2).equals("버피테스트") || rs.getString(2).equals("팔 벌려 뛰기") || rs.getString(2).equals("플랭크")) {
					
				} else {
					WorkOutDTO dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3)
							,rs.getInt(4),rs.getString(5));
					arr.add(dto);
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}
	public ArrayList<WorkOutDTO> WorkOutRoutine(UserVO vo) {
		WorkOutDTO dto;
		ArrayList<WorkOutDTO> arr = new ArrayList<>();		
		getConnection();
		String sql = "select * from workoutroutine where workoutclass = ?";
		int score = vo.getGrade()%10;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, Integer.toString(vo.getProgress()));
			rs = pst.executeQuery();
			while(rs.next()) {
				String order = rs.getString(5);
				if(order.equals("1")) {
					dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5));
				} else {
						dto = new WorkOutDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4)+score,rs.getString(5));
				}
				arr.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}

}
