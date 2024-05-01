<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>Event Data</h1>
    <table border="1">
        <tr>
            <th>Proposer Name</th>
            <th>Event Name</th>
            <th>Event Description</th>
            <th>Venue</th>
            <th>Event Date</th>
            <th>From Time</th>
            <th>To Time</th>
            <th>Approved by Faculty</th>
            <th>Approved by Dean</th>
            <th>Approved by Head of Student Council</th>
            <th class="button-column">Actions</th>
        </tr>
        <!-- Insert data rows dynamically using Java -->
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "root");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM events");

                while (rs.next()) {
        %>
<tr>
    <td><%= rs.getString("proposer_name") %></td>
    <td><%= rs.getString("event_name") %></td>
    <td><%= rs.getString("event_description") %></td>
    <td><%= rs.getString("venue") %></td>
    <td><%= rs.getString("event_date") %></td>
    <td><%= rs.getString("from_time") %></td>
    <td><%= rs.getString("to_time") %></td>
    <td><%= rs.getInt("approved_by_faculty") == 0 ? "Not Approved" : "Approved" %></td>
    <td><%= rs.getInt("approved_by_dean") == 0 ? "Not Approved" : "Approved" %></td>
    <td><%= rs.getInt("approved_by_head_of_student_council") == 0 ? "Not Approved" : "Approved" %></td>
    <td class="button-column">
        <form action="your_page.jsp" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button type="submit" name="action" value="approve">Approve</button>
            <button type="submit" name="action" value="reject">Reject</button>
        </form>
    </td>
</tr>

        <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
