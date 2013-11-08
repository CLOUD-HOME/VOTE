package com.cloud.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

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
		}
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paperid = request.getParameter("paperid");
		String papername = request.getParameter("papername");
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		String answer = request.getParameter("answer");
		Connection conn = DBUtil.getConn();
		String sql = "insert into examination values (null, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, paperid);
			ps.setString(2, papername);
			ps.setString(3, content);
			ps.setString(4, type);
			ps.setString(5, answer);
			ps.executeUpdate();
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
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		String answer = request.getParameter("answer");
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
			ps.executeUpdate();
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
		String temp = "select * from examination where paperid = ?";
		try {
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBUtil.getConn();
		String temp = "select distinct paperid, papername from examination order by id desc limit 0, 10";
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
		String sql = "select * from examination";
		Connection conn = DBUtil.getConn();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
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
			String a = JSONArray.fromObject(elist).toString();
			//String json = "{\"total\":\"1\",\"rows\":[{\"id\":\"41525\",\"firstname\":\"ddd\",\"lastname\":\"dfsa \",\"phone\":\"34343df\",\"email\":\"\"}]}";
			String json = "{\"total\":\"" + 7 + "\", \"rows\":" + JSONArray.fromObject(elist).toString() + "}";
			response.getWriter().write(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}

}
