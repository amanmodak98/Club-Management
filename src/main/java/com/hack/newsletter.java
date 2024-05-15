package com.hack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class newsletter extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root")) {
                // Insert email into the database along with signup date
            	String sql = "INSERT INTO newsletter (email, signup_date) VALUES (?, CURRENT_TIMESTAMP)";

                try (PreparedStatement insertStmt = con.prepareStatement(sql)) {
                    insertStmt.setString(1, email);

                    int rowsInserted = insertStmt.executeUpdate();

                    if (rowsInserted > 0) {
                        // Email inserted successfully, redirect to success page
                        response.sendRedirect("thankyou.html");
                    } else {
                        // Failed to insert email, redirect to error page
                        response.sendRedirect("error.html");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("error.html");
        }
    }

}
