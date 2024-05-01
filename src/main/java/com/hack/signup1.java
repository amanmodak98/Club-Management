package com.hack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class signup1 extends HttpServlet {
    public signup1() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String s1 = request.getParameter("name");
        String s2 = request.getParameter("uname");
        String s3 = request.getParameter("upass");
        String s4 = request.getParameter("role");
        String s5 = request.getParameter("club");
        String s6 = request.getParameter("roll");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root");

            // Check if the username already exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM users WHERE name = ?");
            checkStmt.setString(1, s1);
            ResultSet resultSet = checkStmt.executeQuery();

            if (resultSet.next()) {
                // Username already exists, redirect to a JSP page indicating username taken
                RequestDispatcher rd = request.getRequestDispatcher("usernameTaken.jsp");
                rd.forward(request, response);
            } else {
                // Username is not taken, proceed with signup1
                PreparedStatement insertStmt = con.prepareStatement("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)");
                insertStmt.setString(1, s1);
                insertStmt.setString(2, s2);
                insertStmt.setString(3, s3);
                insertStmt.setString(4, s4);
                insertStmt.setString(5, s5);
                insertStmt.setString(6, s6);

                int i = insertStmt.executeUpdate();

                if (i > 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
                    rd.forward(request, response);
                } else {
                    System.out.println("Welcome");
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}