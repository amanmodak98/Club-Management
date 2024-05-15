package com.hack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AddEvent extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("uname");
        String proposerName = request.getParameter("proposer_name");
        String eventName = request.getParameter("event_name");
        String eventDescription = request.getParameter("event_description");
        String venue = request.getParameter("venue");
        String eventDate = request.getParameter("event_date");
        String fromTime = request.getParameter("from_time");
        String toTime = request.getParameter("to_time");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root")) {
                // Insert event into the database
                String sql = "INSERT INTO events (user_id, proposer_name, event_name, event_description, venue, event_date, from_time, to_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStmt = con.prepareStatement(sql)) {
                    insertStmt.setString(1, userId);
                    insertStmt.setString(2, proposerName);
                    insertStmt.setString(3, eventName);
                    insertStmt.setString(4, eventDescription);
                    insertStmt.setString(5, venue);
                    insertStmt.setString(6, eventDate);
                    insertStmt.setString(7, fromTime);
                    insertStmt.setString(8, toTime);

                    int rowsInserted = insertStmt.executeUpdate();

                    if (rowsInserted > 0) {
                        // Event inserted successfully, redirect to success page
                        response.sendRedirect("success.html");
                    } else {
                        // Failed to insert event, redirect to error page
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
