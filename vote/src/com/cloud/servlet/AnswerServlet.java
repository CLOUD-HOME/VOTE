package com.cloud.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cloud.model.Employee;
import com.cloud.util.DBUtil;

/**
 * Servlet implementation class AnswerServlet
 */
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerServlet() {
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
		}
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String paperid = request.getParameter("paperid");
		String fcount = request.getParameter("fcount");
		String scount = request.getParameter("scount");
		String mcount = request.getParameter("mcount");
		Employee e = (Employee) request.getSession().getAttribute("employee");
		Integer userid = e.getId();
		int temp1 = Integer.parseInt(fcount);
		int temp2 = Integer.parseInt(fcount) + Integer.parseInt(scount);
		List<String> sqls = new ArrayList<String>();
		for (int i = 0; i < Integer.parseInt(fcount); i++) {
			//System.out.println(request.getParameter("answer" + i+1));
			//System.out.println(request.getParameterValues("answer" + (i+1)));
			String[] arr1 = request.getParameterValues("answer" + (i+1));
			String[] arr2 = request.getParameterValues("id" + (i+1));
			StringBuffer sb1 = new StringBuffer();
			StringBuffer sb2 = new StringBuffer();
			for (int j = 0; j < arr1.length; j++) {
				sb1.append(new String(arr1[j].getBytes("ISO-8859-1"),"utf-8")+"#");
				sb2.append(arr2[j]+"#");
				//System.out.println(arr1[j]);
				//System.out.println(arr2[j]);
			}
			String sql = "insert into answer values (null, "+ userid +", "+ sb2.toString().split("#")[0] +",'"+ sb1.toString().substring(0,sb1.toString().length()-1) +"',"+ paperid +");";
			sqls.add(sql);
			System.out.println(sql);
		}
		for (int i = temp1; i < temp1 + Integer.parseInt(scount); i++) {
			System.out.println(request.getParameter("answer" + (i+1)));
			String sql = "insert into answer values (null, "+ userid +", "+ request.getParameter("id" + (i+1)) +",'"+ request.getParameter("answer" + (i+1)) +"',"+ paperid +");";
			sqls.add(sql);
			System.out.println(sql);
		}
		for (int i = temp2; i < temp2 + Integer.parseInt(mcount); i++) {
			StringBuffer sb = new StringBuffer();
			String[] arr = request.getParameterValues("answer" + (i+1));
			for (int j = 0; j < arr.length; j++) {
				sb.append(arr[j]+"#");
			}
			String sql = "insert into answer values (null, "+ userid +", "+ request.getParameter("id" + (i+1)) +",'"+ sb.toString().substring(0,sb.toString().length()-1) +"',"+ paperid +");";
			sqls.add(sql);
			System.out.println(sql);
		}
		Connection conn = DBUtil.getConn();
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();
			for (Iterator<String> iterator = sqls.iterator(); iterator.hasNext();) {
				String string = (String) iterator.next();
				stmt.execute(string);
			}
			conn.commit();
			/*
			 * 
			for (Iterator<String> iterator = sqls.iterator(); iterator.hasNext();) {
				String string = (String) iterator.next();
				PreparedStatement ps = conn.prepareStatement(string);
				ps.executeUpdate();
			}
			 */
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		response.sendRedirect(request.getContextPath() + "/thanks.jsp");
	}
	
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
