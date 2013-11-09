package com.cloud.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cloud.model.Employee;

public class EmployeeDAO {
    Connection connection;
    Statement stmt;
    private int noOfRecords;
 
    public EmployeeDAO() { }
 
    private static Connection getConnection()
            throws SQLException,
                ClassNotFoundException
    {
        Connection con = ConnectionFactory.
                getInstance().getConnection();
        return con;
    }
 
    public List<Employee> viewAllEmployees(
                int offset,
                int noOfRecords)
    {
        String query = "select SQL_CALC_FOUND_ROWS * from employee limit "
                 + offset + ", " + noOfRecords;
        System.out.println(query);
        List<Employee> list = new ArrayList<Employee>();
        Employee employee = null;
        try {
            connection = getConnection();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                employee = new Employee();
                employee.setEmail(rs.getString("email"));
                list.add(employee);
            }
            rs.close();
 
            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next()){
            	
            	this.noOfRecords = rs.getInt(1);
            	System.out.println("sssssssssssssssssss"+this.noOfRecords);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally
        {
            try {
                if(stmt != null)
                    stmt.close();
                if(connection != null)
                    connection.close();
                } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
 
    public int getNoOfRecords() {
        return noOfRecords;
    }
}