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
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	

}
