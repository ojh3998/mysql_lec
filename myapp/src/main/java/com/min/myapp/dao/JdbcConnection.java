package com.min.myapp.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

@Component  
public class JdbcConnection {

  public Connection getConnection() {
    Connection conn = null;
    try {
      String driver = "com.mysql.cj.jdbc.Driver";
      String url = "jdbc:mysql://127.0.0.1:3306/db_app06?serverTimezone=Asia/Seoul";
      String username = "greenit";
      String password = "greenit";
   
      Class.forName(driver);
      
      conn = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return conn;
  }
  
  public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
    try {
      if(conn != null) conn.close();
      if(ps != null) ps.close();
      if(rs != null) rs.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
}
