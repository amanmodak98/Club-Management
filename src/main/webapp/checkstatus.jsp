<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #dee2e6;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .button-column button {
            padding: 8px 16px;
            margin-right: 5px;
            border: none;
            cursor: pointer;
            background-color: #28a745;
            color: #fff;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button-column button:hover {
            background-color: #218838;
        }

        .approved {
            color: #28a745;
            font-weight: bold;
        }

        .not-approved {
            color: #dc3545;
            font-weight: bold;
        }

        .button-column button:disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }
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
                Class.forName("com.mysql.cj.jdbc.Driver");
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
        </tr>
        <% 
                }
            } catch (SQLException | ClassNotFoundException e) {
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
