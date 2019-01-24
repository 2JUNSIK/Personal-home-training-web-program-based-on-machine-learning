package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql = null;
	int cnt = 0;

	/* DB Conncect */
	public void getConnection() {
		String url = "jdbc:oracle:thin:@168.131.22.73:1521:xe";
		String user = "system";
		String password = "12345";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);

			if (conn != null) {
				System.out.println("Health DB Success!");
			} else {
				System.out.println("Health DB Fail!");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/* DB exit */
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* Login */
	public String Health_LOGIN(UserVO mvo) {
		getConnection();

		String uname = null;
		sql = "select uname from health_member where userid=? and pw=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mvo.getId());
			pst.setString(2, mvo.getPw());

			rs = pst.executeQuery();

			if (rs.next()) {
				uname = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return uname;
	}

	/* Join basic */
	public int Health_JOIN(UserVO mvo) {
		getConnection();

		sql = "insert into health_member values(?,?,?,?,?,?,?,?,?,?,?)";

		try {

			pst = conn.prepareStatement(sql);
			pst.setString(1, mvo.getName());
			pst.setString(2, mvo.getId());
			pst.setString(3, mvo.getPw());
			pst.setString(4, mvo.getEmail());
			pst.setInt(5, mvo.getAge());
			pst.setString(6, mvo.getGender());
			pst.setString(7, mvo.getAddress());
			pst.setString(8, mvo.getHp());
			pst.setInt(9, mvo.getGrade());
			pst.setInt(10, mvo.getProgressdate());
			pst.setInt(11, mvo.getProgress());

			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	/* Join detail */
	public int Health_JOIN_detail(UserDetailVO dvo) {
		getConnection();

		sql = "insert into health_member_detail values(?,?,?,?,?,?,?,?,?,?)";

		try {

			pst = conn.prepareStatement(sql);
			pst.setString(1, dvo.getId());
			pst.setString(2, dvo.getHeight());
			pst.setString(3, dvo.getWeight());
			pst.setString(4, dvo.getMuscle());
			pst.setString(5, dvo.getTargetPeriod());
			pst.setString(6, dvo.getTargetAmount());
			pst.setString(7, dvo.getDesirePart());
			pst.setString(8, dvo.getBurglar());
			pst.setString(9, dvo.getHomeorGym());
			pst.setString(10, dvo.getBodyShape());

			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	/* true -> double, false -> not double */
	public String IdDouble(String id) {
		getConnection();

		sql = "select * from health_member where userid=?";

		String isDouble = "success";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				isDouble = "fail";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return isDouble;
	}

	public String[] getMemInfo(String id) {
		getConnection();

		sql = "select uname,age,gender from health_member where userid=?";

		String[] mem = new String[3];
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				mem[0] = rs.getString(1);
				mem[1] = rs.getString(2);
				mem[2] = rs.getString(3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mem;
	}

	/* BMI 지수 계산을 위한 키,몸무게,성별 ,나이 가져오기 */
	public String[] gethweight(String id) {
		getConnection();

		String[] hwga = new String[4];
		sql = "select height,weight " + "from health_member_detail " + "where userID=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				hwga[0] = rs.getString(1);
				hwga[1] = rs.getString(2);
			} else {
			}

			sql = "select gender,age " + "from health_member " + "where userID=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();
			if (rs.next()) {
				hwga[2] = rs.getString(1);
				hwga[3] = rs.getString(2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return hwga;
	}

	/* ȸ����� ������ ���� grade �������� */
	public int getGrade(String id) {
		getConnection();

		int grade = -1;
		sql = "select grade from health_member where userid=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				grade = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return grade;
	}

	/* ����ȭ�鿡 �ʿ��� ��ǥ�Ⱓ ��ǥ�� �������� */
	public String[] getMemTarget(String id) {
		getConnection();

		String[] Target = new String[2];

		sql = "select targetPeriod, targetAmount from health_member_detail where id =?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();

			if (rs.next()) {
				Target[0] = rs.getString(1);
				Target[1] = rs.getString(2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return Target;
	}

	/* ȸ������ ������Ʈ */
	public int updateMemInfo(String id, UserVO mvo, UserDetailVO dvo) {

		getConnection();

		try {
			sql = "update health_member set pw = ?, age = ?, address = ? where id = ?";

			pst = conn.prepareStatement(sql);
			pst.setString(1, mvo.getPw());
			pst.setInt(2, mvo.getAge());
			pst.setString(3, mvo.getAddress());
			pst.setString(4, id);

			cnt = pst.executeUpdate();

			if (cnt > 0) {

				sql = "update health_member h inner join health_member_detail d " + "on h.userID = d.userID"
						+ "set d.height=?, d.weight=?, d.muscle=?,d.targetPeriod=?,d.targetAmount=?,d.desirepart=?,d.burglar=?,d.HorG=?,d.bodyshape=?"
						+ "where h.userid=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, dvo.getHeight());
				pst.setString(2, dvo.getWeight());
				pst.setString(3, dvo.getMuscle());
				pst.setString(4, dvo.getTargetPeriod());
				pst.setString(5, dvo.getTargetAmount());
				pst.setString(6, dvo.getDesirePart());
				pst.setString(7, dvo.getBurglar());
				pst.setString(8, dvo.getHomeorGym());
				pst.setString(9, dvo.getBodyShape());
				pst.setString(10, id);

				cnt = pst.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}

	/* ȸ�� Ż��� ���� ���� */
	public int deleteMember(String id) {

		getConnection();
		sql = "delete from health_member_detail where userid=?";
		try {

			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			cnt = pst.executeUpdate();

			if (cnt > 0) {
				sql = "delete from health_member where userid=?";

				pst = conn.prepareStatement(sql);
				pst.setString(1, id);

				cnt = pst.executeUpdate();
			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<String> Search(String search) {
		getConnection();

		ArrayList<String> cooking_names = new ArrayList<String>();
		sql = "select cooking_name from cooking where cooking_name like %?%";
		try {

			pst = conn.prepareStatement(sql);
			pst.setString(1, search);

			rs = pst.executeQuery();

			while (rs.next()) {
				cooking_names.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return cooking_names;
	}

	// 근육량 입력시 나오는 식단
	public boolean getMuscle(String id) {
		boolean m = false;
		getConnection();

		sql = "select muscle from health_member_detail where userid = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			rs = pst.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals("normal")) {
					m = false;
				} else {
					m = true;	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	
		return m;
	}

	// 모든 유저 정보
	public ArrayList<UserVO> AllUserInfo() {
		getConnection();
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		sql = "select * from health_member";

		try {
			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {
				UserVO temp = new UserVO();

				temp.setName(rs.getString(1));
				temp.setId(rs.getString(2));
				temp.setPw(rs.getString(3));
				temp.setEmail(rs.getString(4));
				temp.setAge(rs.getInt(5));
				temp.setGender(rs.getString(6));
				temp.setAddress(rs.getString(7));
				temp.setHp(rs.getString(8));
				temp.setGrade(rs.getInt(9));
				temp.setProgressdate(rs.getInt(10));
				temp.setProgress(rs.getInt(11));

				list.add(temp);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return null;
	}

	// 모든 유저 Body정보
	public ArrayList<UserDetailVO> AllUserInfo2() {
		getConnection();
		ArrayList<UserDetailVO> list = new ArrayList<UserDetailVO>();
		sql = "select * from health_member_detail";

		try {
			pst = conn.prepareStatement(sql);

			rs = pst.executeQuery();

			while (rs.next()) {
				UserDetailVO temp = new UserDetailVO();

				temp.setId(rs.getString(1));
				temp.setHeight(rs.getString(2));
				temp.setWeight(rs.getString(3));
				temp.setMuscle(rs.getString(4));
				temp.setTargetPeriod(rs.getString(5));
				temp.setTargetAmount(rs.getString(6));
				temp.setDesirePart(rs.getString(7));
				temp.setBurglar(rs.getString(8));
				temp.setHomeorGym(rs.getString(9));
				temp.setBodyShape(rs.getString(10));

				list.add(temp);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return null;
	}

	public int updateUserDayScore(UserVO vo) {
		getConnection();
		sql = "update health_member set grade = ?, progress = ? where userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, vo.getGrade());
			pst.setInt(2, vo.getProgress());
			pst.setString(3, vo.getId());
			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	public int getProgress(String uid) {
		getConnection();

		int progress = -1;
		sql = "select progress from health_member where userid=?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, uid);

			rs = pst.executeQuery();

			if (rs.next()) {
				progress = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return progress;

	}
}
