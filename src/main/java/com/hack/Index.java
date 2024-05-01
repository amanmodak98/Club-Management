package com.hack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Index extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Index() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        String role = request.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root")) {

                // Perform database operations
                String query = "SELECT * FROM users WHERE user_id=? AND password=? AND role=?";
                try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                    pstmt.setString(1, uname);
                    pstmt.setString(2, upass);
                    pstmt.setString(3, role);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Create or retrieve session
                            HttpSession session = request.getSession();
                            session.setMaxInactiveInterval(1200); // Set session timeout to 20 minutes (20 * 60 seconds)
                            
                            // Set user attributes in session
                            session.setAttribute("uname", uname);
                            session.setAttribute("role", role);

                            String redirectPage = determineRedirectPage(role, rs);
                            
                            // Redirect user to the respective page
                            response.sendRedirect(redirectPage);
                        } else {
                            // User authentication failed
                            response.sendRedirect("login.html"); // Redirect to login page with error message
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle database connection errors
            response.sendRedirect("error.html"); // Redirect to error page with error message
        }
    }
    
    private String determineRedirectPage(String role, ResultSet rs) throws Exception {
        if (role.equals("dean")) {
            return "dean.jsp"; // Dynamic content for dean
        } else if (role.equals("faculty")) {
            return "faculty.jsp"; // Dynamic content for faculty
        } else if (role.equals("head of student council")) {
            return "head_of_student_council.jsp"; // Dynamic content for head of student council
        } else if (role.equals("student")) {
            String club = rs.getString("club");
            switch (club) {
                case "udaan":
                    return "udaan.jsp"; // Dynamic content for udaan club
                case "utthan":
                    return "utthan.jsp"; // Dynamic content for utthan club
                case "utprerna":
                    return "utprerna.jsp"; // Dynamic content for utprerna club
                case "urja":
                    return "urja.jsp"; // Dynamic content for urja club
                default:
                    return "error.jsp"; // Dynamic error page for invalid club
            }
        } else {
            // Handle invalid role
            return "error.jsp"; // Dynamic error page for invalid role
        }
    }

    // Restrict direct access to event.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("uname") != null) {
            // User is logged in, allow access to event.jsp
            request.getRequestDispatcher("event.jsp").forward(request, response);
        } else {
            // User is not logged in, redirect to login page
            response.sendRedirect("login.html");
        }
    }
}
