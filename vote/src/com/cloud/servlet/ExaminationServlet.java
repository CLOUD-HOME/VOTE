package com.cloud.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.cloud.model.Employee;
import com.cloud.model.Examination;
import com.cloud.util.DBUtil;

/**
 * Servlet implementation class ExaminationServlet
 */
public class ExaminationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExaminationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("find".equals(method)) {
			find(request, response);
		} else if("query".equals(method)) {
			query(request, response);
		} else if("search".equals(method)) {
			search(request, response);
		} else if("querye".equals(method)) {
			querye(request,response);
		} else if("destroy".equals(method)) {
			destroy(request, response);
		} else if("querys".equals(method)) {
			querys(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("insert".equals(method)) {
			insert(request, response);
		} else if("update".equals(method)) {
			update(request, response);
		} else if("destroy".equals(method)) {
			destroy(request, response);
		}
	}
	
	private void destroy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Connection conn = DBUtil.getConn();
		String sql = "delete from examination where id = ?";
		String msg = "无法删除，因为已经有用户答过此题目！";
		msg = new String(msg.getBytes("utf-8"),"iso8859-1");
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			int count = ps.executeUpdate();
			if(count >= 1) {
				response.getWriter().write("{\"success\":true}");
			}else {
				response.getWriter().write("{\"errorMsg\":删除失败！}");
			}
		} catch (SQLException e) {
			response.getWriter().write("{\"success\":false,\"errorMsg\":\""+ msg +"\"}");
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paperid = request.getParameter("paperid");
		String papername = request.getParameter("papername");
		papername = new String(papername.getBytes("ISO-8859-1"),"utf-8");
		String content = request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		String type = request.getParameter("type");
		String answer = request.getParameter("answer");
		answer = new String(answer.getBytes("ISO-8859-1"),"utf-8");
		Connection conn = DBUtil.getConn();
		String sql = "insert into examination values (null, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, paperid);
			ps.setString(2, papername);
			ps.setString(3, content);
			ps.setString(4, type);
			ps.setString(5, answer);
			int count = ps.executeUpdate();
			if(count >= 1) {
				response.getWriter().write("{\"success\":true}");
			}else {
				response.getWriter().write("{\"errorMsg\":删除失败！}");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String paperid = request.getParameter("paperid");
		String papername = request.getParameter("papername");
		papername = new String(papername.getBytes("ISO-8859-1"),"utf-8");
		String content = request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		String type = request.getParameter("type");
		String answer = request.getParameter("answer");
		answer = new String(answer.getBytes("ISO-8859-1"),"utf-8");
		Connection conn = DBUtil.getConn();
		String sql = "update examination set paperid = ?, papername = ?, content = ?, type = ?, answer = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, paperid);
			ps.setString(2, papername);
			ps.setString(3, content);
			ps.setString(4, type);
			ps.setString(5, answer);
			ps.setString(6, id);
			int count = ps.executeUpdate();
			if(count >= 1) {
				response.getWriter().write("{\"success\":true}");
			}else {
				response.getWriter().write("{\"errorMsg\":删除失败！}");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}

	
	private void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paperid = request.getParameter("paperid");
		Connection conn = DBUtil.getConn();
		String sql = "SELECT * FROM answer WHERE paperid = ? and userid = ? limit 0,1";
		String temp = "select * from examination where paperid = ?";
		String sql2 = "SELECT examination.id, examination.paperid, examination.papername, examination.content, examination.type, answer.answer FROM examination LEFT JOIN answer ON examination.id = answer.examid WHERE answer.paperid = ? AND userid = ?";
		try {
			PreparedStatement ps1 = conn.prepareStatement(sql);
			ps1.setString(1, paperid);
			ps1.setInt(2, ((Employee)request.getSession().getAttribute("employee")).getId());
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next()) {
				PreparedStatement ps = conn.prepareStatement(sql2);
				ps.setString(1, paperid);
				ps.setInt(2, ((Employee)request.getSession().getAttribute("employee")).getId());
				ResultSet rs = ps.executeQuery();
				List<Examination> elist = new ArrayList<Examination>();
				while(rs.next()) {
					Examination e = new Examination();
					e.setAnswer(rs.getString("answer"));
					e.setContent(rs.getString("content"));
					e.setId(rs.getInt("id"));
					e.setPaperid(rs.getInt("paperid"));
					e.setType(rs.getString("type"));
					e.setPapername(rs.getString("papername"));
					elist.add(e);
				}
				request.setAttribute("elist", elist);
				request.getRequestDispatcher("/show.jsp").forward(request, response);
			} else {
				PreparedStatement ps = conn.prepareStatement(temp);
				ps.setString(1, paperid);
				ResultSet rs = ps.executeQuery();
				List<Examination> elist = new ArrayList<Examination>();
				while(rs.next()) {
					Examination e = new Examination();
					e.setAnswer(rs.getString("answer"));
					e.setContent(rs.getString("content"));
					e.setId(rs.getInt("id"));
					e.setPaperid(rs.getInt("paperid"));
					e.setType(rs.getString("type"));
					e.setPapername(rs.getString("papername"));
					elist.add(e);
				}
				request.setAttribute("elist", elist);
				request.getRequestDispatcher("/content.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBUtil.getConn();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		String temp = null;
		if(employee == null) {
			temp = "select distinct paperid, papername from examination order by id desc limit 0, 10";
		} else {
			temp = "SELECT DISTINCT	paperid, papername FROM	examination WHERE paperid NOT IN (SELECT DISTINCT paperid FROM answer WHERE userid = "+ employee.getId() +")";
		}
		System.out.println(temp);
		try {
			PreparedStatement ps = conn.prepareStatement(temp);
			ResultSet rs = ps.executeQuery();
			List<Examination> plist = new ArrayList<Examination>();
			while(rs.next()) {
				Examination e = new Examination();
				e.setPaperid(rs.getInt("paperid"));
				e.setPapername(rs.getString("papername"));
				plist.add(e);
			}
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	
	private void querys(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBUtil.getConn();
		Employee employee = (Employee) request.getSession().getAttribute("employee");
		String temp = null;
		if(employee == null) {
			response.sendRedirect(request.getContextPath() + "/register.jsp");
			return;
		} else {
			temp = "SELECT DISTINCT examination.paperid, examination.papername FROM answer LEFT JOIN examination ON answer.paperid = examination.paperid WHERE answer.userid = " + employee.getId();
		}
		System.out.println(temp);
		try {
			PreparedStatement ps = conn.prepareStatement(temp);
			ResultSet rs = ps.executeQuery();
			List<Examination> plist = new ArrayList<Examination>();
			while(rs.next()) {
				Examination e = new Examination();
				e.setPaperid(rs.getInt("paperid"));
				e.setPapername(rs.getString("papername"));
				plist.add(e);
			}
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBUtil.getConn();
		String keyword = request.getParameter("keyword");
		keyword = new String(keyword.getBytes("iso8859-1"),"utf-8");
		String temp = "select distinct paperid, papername from examination where papername like '%" + keyword + "%'";
		try {
			PreparedStatement ps = conn.prepareStatement(temp);
			ResultSet rs = ps.executeQuery();
			List<Examination> plist = new ArrayList<Examination>();
			while(rs.next()) {
				Examination e = new Examination();
				e.setPaperid(rs.getInt("paperid"));
				e.setPapername(rs.getString("papername"));
				plist.add(e);
			}
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}

	private void querye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Enumeration<String> params = request.getParameterNames();
		/**
		 * 
		for (Enumeration<String> e = params; e.hasMoreElements();)
		       System.out.println(e.nextElement());
		 */
		int pagenumber = Integer.parseInt(request.getParameter("page"));
		int pagesize = Integer.parseInt(request.getParameter("rows"));
		int total = 0;
		String sql = "select * from examination limit " + (pagenumber-1)*pagesize + "," + pagesize;
		Connection conn = DBUtil.getConn();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			PreparedStatement ps1 = conn.prepareStatement("select count(*) from examination");
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next()) {
				total = rs1.getInt(1);
			}
			List<Examination> elist = new ArrayList<Examination>();
			while(rs.next()) {
				Examination e = new Examination();
				e.setPaperid(rs.getInt("paperid"));
				e.setPapername(rs.getString("papername"));
				e.setAnswer(rs.getString("answer"));
				e.setId(rs.getInt("id"));
				e.setContent(rs.getString("content"));
				e.setType(rs.getString("type"));
				elist.add(e);
			}
			response.setContentType("text/html;charset=utf-8");
			//String json = "{\"total\":\"1\",\"rows\":[{\"id\":\"41525\",\"firstname\":\"ddd\",\"lastname\":\"dfsa \",\"phone\":\"34343df\",\"email\":\"\"}]}";
			String json = "{\"total\":\"" + total + "\", \"rows\":" + JSONArray.fromObject(elist).toString() + "}";
			response.getWriter().write(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}

}
