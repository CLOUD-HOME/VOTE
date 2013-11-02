package com.cloud.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String vcode1 = request.getParameter("vcode");
		String vcode2 = (String) request.getSession().getAttribute("vcode");
		String msg = null;
		if(vcode1.equals(vcode2)) {
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
		String sql = "insert into employee (email, password, emailmd5, randommd5, isactivate) values (?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, emailmd5);
			ps.setString(4, randommd5);
			ps.setString(5, "0");
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		
		SendMail sm = new SendMail();
		String vcode = new ValidateCode().randomString();
		try {
			sm.sendVerify(email, emailmd5, randommd5, vcode);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg = "★邮件已发送到你的邮箱,请查收邮件获取验证码！";
		HttpSession session=request.getSession();
		session.setAttribute("vcode", vcode);
		msg = new String(msg.getBytes("utf-8"),"iso8859-1");
		response.sendRedirect(request.getContextPath() + "/register_next.jsp?msg=" + msg);
	}

}
