package core;

import java.sql.*;

import org.json.simple.JSONObject;

import util.*;

public class UserDAO {
	public String login(String uid, String upass) throws Exception {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "SELECT id, name, password FROM user WHERE id = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, uid);
	
			rs = st.executeQuery();
			String code = "OK";
			if (!rs.next()) {
				code = "NA";
			}
			else if (!rs.getString("password").equals(upass)) {
				code = "PS";
			}
			else {
				//code = "OK";
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("id", rs.getString("id"));
				jsonobj.put("name", rs.getString("name"));
				code = jsonobj.toJSONString();	// { id: "kim123", name: "김시민" }
			}
			return code;
			
		} finally {
			if(rs != null) rs.close(); 
			if (st != null) st.close(); 
			if (conn != null) conn.close();
		}
	}
	
	public String signup(String uid, String upass, String uemail, String uname, String utel, String ubirth) throws Exception {			
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
		conn = ConnectionPool.getInstance().getConn();
		
		String sql = "SELECT id FROM user WHERE id = ?";
		st = conn.prepareStatement(sql);
		st.setString(1, uid);
		
		rs = st.executeQuery();
		
		String code = "EX";
		if (rs.next()) {
			code = "EX";
		}
		
		else {
			st.close();
			
			sql = "INSERT INTO user(id, password, email, name, tel, birth) VALUES(?, ?, ?, ?, ?, ?)";
			
			st = conn.prepareStatement(sql);
			st.setString(1, uid);
			st.setString(2, upass);
			st.setString(3, uemail);
			st.setString(4, uname);
			st.setString(5, utel);
			st.setString(6, ubirth);
			
			int cnt = st.executeUpdate();
			if(cnt == 0) {
				code = "ER";
			}
			else {
				code = "OK";
			}	
		}
		return code;
		
		}finally {
			if(rs != null) rs.close(); 
			if (st != null) st.close(); 
			if (conn != null) conn.close();
		}
	}

public String findid(String uname, String utel, String ubirth) throws Exception {
	Connection conn = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	try {
		conn = ConnectionPool.getInstance().getConn();
		
		String sql = "SELECT id FROM user WHERE name = ?";
		st = conn.prepareStatement(sql);
		st.setString(1, uname);

		rs = st.executeQuery();
		String code = "OK";
		if (!rs.next()) {
			code = "NA";
		}
		else {
			//code = "OK";
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("id", rs.getString("id"));
			code = jsonobj.toJSONString();
		}
		return code;
		
	} finally {
		if(rs != null) rs.close(); 
		if (st != null) st.close(); 
		if (conn != null) conn.close();
		}
	}

public String findps(String uid, String uname, String utel) throws Exception {
	Connection conn = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	try {
		conn = ConnectionPool.getInstance().getConn();
		
		String sql = "SELECT password FROM user WHERE id = ?";
		st = conn.prepareStatement(sql);
		st.setString(1, uid);

		rs = st.executeQuery();
		String code = "OK";
		if (!rs.next()) {
			code = "NA";
		}
		else {
			//code = "OK";
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("password", rs.getString("password"));
			code = jsonobj.toJSONString();
		}
		return code;
		
	} finally {
		if(rs != null) rs.close(); 
		if (st != null) st.close(); 
		if (conn != null) conn.close();
		}
	}
}