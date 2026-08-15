<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
Integer userId = (Integer) session.getAttribute("userId");
String name = (String) session.getAttribute("name");

if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    conn = DBConnection.getConnection();

    String sql =
        "SELECT m.registration_date, m.status, " +
        "f.plan_name, f.duration, f.amount, f.facilities " +
        "FROM memberships m " +
        "JOIN fees f ON m.fee_id = f.id " +
        "WHERE m.user_id = ? " +
        "ORDER BY m.id DESC LIMIT 1";

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, userId);

    rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>My Membership</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
        }

        .header {
            background: #1f2937;
            color: white;
            padding: 20px 35px;
        }

        .container {
            width: 700px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
        }

        .details {
            margin-top: 25px;
        }

        .row {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        .label {
            font-weight: bold;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="header">
    <h2>🏋️ Universal Fitness</h2>
</div>

<div class="container">

    <h2>My Membership</h2>

<%
    if (rs.next()) {
%>

    <p>Welcome, <strong><%= name %></strong></p>

    <div class="details">

        <div class="row">
            <span class="label">Plan:</span>
            <%= rs.getString("plan_name") %>
        </div>

        <div class="row">
            <span class="label">Duration:</span>
            <%= rs.getString("duration") %>
        </div>

        <div class="row">
            <span class="label">Amount:</span>
           &#8377;<%= rs.getDouble("amount") %>
        </div>

        <div class="row">
            <span class="label">Facilities:</span>
            <%= rs.getString("facilities") %>
        </div>

        <div class="row">
            <span class="label">Registration Date:</span>
            <%= rs.getDate("registration_date") %>
        </div>

        <div class="row">
            <span class="label">Status:</span>
            <%= rs.getString("status") %>
        </div>

    </div>

<%
    } else {
%>

    <p style="text-align:center;">
        You don't have any active membership.
    </p>

<%
    }

} catch (Exception e) {

    out.println("<p>Error: " + e.getMessage() + "</p>");

} finally {

    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
	<div style="text-align:center; margin-top:25px;">

    <a href="updateMembership.jsp"
       style="background:#2563eb;
              color:white;
              padding:10px 18px;
              text-decoration:none;
              border-radius:6px;">
        Update Membership
    </a>

    <a href="deleteMembership.jsp"
       onclick="return confirm('Are you sure you want to delete your membership?');"
       style="background:#dc2626;
              color:white;
              padding:10px 18px;
              text-decoration:none;
              border-radius:6px;
              margin-left:10px;">
        Delete Membership
    </a>

</div>

    <a class="back" href="userDashboard.jsp">
        Back to Dashboard
    </a>

</div>

</body>
</html>