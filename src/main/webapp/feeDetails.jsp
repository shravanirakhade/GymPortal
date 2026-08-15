<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
String id = request.getParameter("id");

if (id == null || id.trim().isEmpty()) {
    out.println("<h2>Fee ID is missing.</h2>");
    return;
}

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {

    conn = DBConnection.getConnection();

    String sql = "SELECT * FROM fees WHERE id = ?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(id));

    rs = pstmt.executeQuery();

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Fee Details</title>

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
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h2 {
    margin: 0;
}

.back {
    color: white;
    text-decoration: none;
    background: #374151;
    padding: 10px 18px;
    border-radius: 6px;
}

.container {
    width: 650px;
    margin: 60px auto;
}

.card {
    background: white;
    padding: 35px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.plan {
    font-size: 32px;
    margin-bottom: 15px;
}

.amount {
    font-size: 30px;
    font-weight: bold;
    margin: 20px 0;
}

.facilities {
    margin-top: 25px;
}

</style>

</head>

<body>

<div class="header">

    <h2>🏋️ Universal Fitness</h2>

    <a class="back" href="fees.jsp">
        Back to Fee Structure
    </a>

</div>

<div class="container">

<%

    if (rs.next()) {

%>

    <div class="card">

        <div class="plan">
            <%= rs.getString("plan_name") %>
        </div>

        <p>
            <strong>Duration:</strong>
            <%= rs.getString("duration") %>
        </p>

        <div class="amount">
         &#8377;<%= rs.getDouble("amount") %>
        </div>

        <div class="facilities">

            <h3>Facilities Included</h3>

            <p>
                ✓ <%= rs.getString("facilities") %>
            </p>

        </div>

    </div>

<%

    } else {

        out.println("<div class='card'><h2>Fee plan not found.</h2></div>");
    }

%>

</div>

</body>
</html>

<%

} catch (Exception e) {

    out.println("<h2>Error: " + e.getMessage() + "</h2>");

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