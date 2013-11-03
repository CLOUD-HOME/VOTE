package com.cloud.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cloud.model.Employee;
import com.cloud.util.DBUtil;
import com.cloud.util.MD5;
import com.cloud.util.SendMail;
import com.cloud.util.ValidateCode;

/**
 * Servlet implementation class EmployeeServlet
 */
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");

		if("query".equals(method)) {
			query(request, response);
		} else if ("insert".equals(method)) {
			insert(request, response);
		} else if ("verify".equals(method)) {
			verify(request, response);
		}
	}

	private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vcode = request.getParameter("vcode");
		String emailmd5 = request.getParameter("emailmd5");
		String randommd5 = request.getParameter("randommd5");
		String msg = null;
		Connection conn = DBUtil.getConn();
		String sql = "update employee set isactivate = 1 where emailmd5 = ? and randommd5 = ? and vcode = ?";
		int count = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, emailmd5);
			ps.setString(2, randommd5);
			ps.setString(3, vcode);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		
		if(count >= 1) {
			Connection conn1 = DBUtil.getConn();
			String temp = "select * from employee where isactivate = 1 and emailmd5 = ? and randommd5 = ? and vcode = ?";
			try {
				PreparedStatement ps = conn1.prepareStatement(temp);
				ps.setString(1, emailmd5);
				ps.setString(2, randommd5);
				ps.setString(3, vcode);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					Employee e = new Employee();
					String email = rs.getString("email");
					String password = rs.getString("password");
					e.setEmail(email);
					e.setPassword(password);
					request.getSession().setAttribute("employee", e);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.close(conn1);
			}
			msg = "恭喜您注册成功！";
			msg = new String(msg.getBytes("utf-8"),"iso8859-1");
			response.sendRedirect(request.getContextPath() + "/result.jsp?msg=" + msg);
		} else {
			msg = "验证码不正确！";
			msg = new String(msg.getBytes("utf-8"),"iso8859-1");
			response.sendRedirect(request.getContextPath() + "/result.jsp?msg=" + msg);
		}
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		MD5 md5 = new MD5();
		SendMail sm = new SendMail();
		String vcode = new ValidateCode().randomString();
		String emailmd5 = null;
		String randommd5 = null;
		try {
			emailmd5 = md5.getMD5Str(email);
			randommd5 = md5.getMD5Str(String.valueOf((new Random().nextInt(999999))));
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Connection conn = DBUtil.getConn();
		String sql = "insert into employee (email, password, emailmd5, randommd5, vcode, isactivate) values (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, emailmd5);
			ps.setString(4, randommd5);
			ps.setString(5, vcode);
			ps.setString(6, "0");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		
		try {
			sm.sendVerify(email, emailmd5, randommd5, vcode);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg = "★邮件已发送到你的邮箱,请查收邮件获取验证码！";
		msg = new String(msg.getBytes("utf-8"),"iso8859-1");
		response.sendRedirect(request.getContextPath() + "/register_next.jsp?emailmd5=" + emailmd5 + "&randommd5=" + randommd5 + "&msg=" + msg);
	}

}
