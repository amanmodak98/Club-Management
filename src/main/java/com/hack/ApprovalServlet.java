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


public class ApprovalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eventId = request.getParameter("event_id");
        String action = request.getParameter("action");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root")) {
                String sql;
                if ("approve".equals(action)) {
                    sql = "UPDATE events SET approved_by_faculty = 1, approved_by_dean = 1, approved_by_head_of_student_council = 1 WHERE event_id = ?";
                } else {
                    sql = "UPDATE events SET approved_by_faculty = 0, approved_by_dean = 0, approved_by_head_of_student_council = 0 WHERE event_id = ?";
                }
                try (PreparedStatement stmt = con.prepareStatement(sql)) {
                    stmt.setString(1, eventId);
                    stmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("login.html"); // Redirect back to the event data page
    }
}
