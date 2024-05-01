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

public class AddEvent extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String proposerName = request.getParameter("proposer_name");
        String eventName = request.getParameter("event_name");
        String eventDescription = request.getParameter("event_description");
        String venue = request.getParameter("venue");
        String eventDate = request.getParameter("event_date");
        String from_time = request.getParameter("from_time");
        String to_time = request.getParameter("to_time");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root")) {
                // Insert event into the database
                PreparedStatement insertStmt = con.prepareStatement("INSERT INTO events (proposer_name, event_name, event_description, venue, event_date, from_time, to_time) VALUES (?, ?, ?, ?, ?, ?, ?)");
                insertStmt.setString(1, proposerName);
                insertStmt.setString(2, eventName);
                insertStmt.setString(3, eventDescription);
                insertStmt.setString(4, venue);
                insertStmt.setString(5, eventDate);
                insertStmt.setString(6, from_time);
                insertStmt.setString(7, to_time);

                int rowsInserted = insertStmt.executeUpdate();

                if (rowsInserted > 0) {
                    // Event inserted successfully, redirect to success page
                    response.sendRedirect("success.html");
                } else {
                    // Failed to insert event, redirect to error page
                    response.sendRedirect("error.html");
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
