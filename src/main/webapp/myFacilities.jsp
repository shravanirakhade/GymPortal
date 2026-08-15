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
        "SELECT f.plan_name, f.facilities, m.status " +
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

<title>My Facilities</title>

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
    width: 650px;
    margin: 50px auto;
    background: white;
    padding: 35px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

h1 {
    text-align: center;
}

.plan {
    text-align: center;
    color: #555;
    margin-bottom: 30px;
}

.facility {
    padding: 15px;
    margin: 10px 0;
    background: #f3f4f6;
    border-radius: 8px;
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

<h1>My Facilities</h1>

<%

if (rs.next()) {

    String planName = rs.getString("plan_name");
    String facilities = rs.getString("facilities");
    String status = rs.getString("status");

%>

<div class="plan">

    <strong>Membership:</strong>
    <%= planName %>

    <br>

    <strong>Status:</strong>
    <%= status %>

</div>

<%

    String[] facilityList = facilities.split(",");

    for (String facility : facilityList) {

%>

    <div class="facility">

        ✓ <%= facility.trim() %>

    </div>

<%

    }

} else {

%>

    <p style="text-align:center;">
        You don't have a membership yet.
    </p>

<%

}

%>

<a class="back" href="userDashboard.jsp">
    Back to Dashboard
</a>

</div>

</body>

</html>

<%

} catch (Exception e) {

    out.println("<h3>Error: " + e.getMessage() + "</h3>");

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