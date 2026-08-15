<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
String name = (String) session.getAttribute("name");
String role = (String) session.getAttribute("role");
Integer userId = (Integer) session.getAttribute("userId");

if (name == null || !"user".equals(role) || userId == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Register Membership</title>

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
    width: 550px;
    margin: 50px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
}

label {
    display: block;
    margin-top: 20px;
    font-weight: bold;
}

select {
    width: 100%;
    padding: 12px;
    margin-top: 7px;
}

button {
    width: 100%;
    padding: 12px;
    margin-top: 25px;
    background: #16a34a;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
}

.back {
    display: block;
    text-align: center;
    margin-top: 20px;
    text-decoration: none;
}

</style>

</head>

<body>

<div class="header">

    <h2>🏋️ Universal Fitness</h2>

</div>

<div class="container">

    <h2>Register Membership</h2>

    <p>
        Welcome, <strong><%= name %></strong>
    </p>

    <form action="saveMembership.jsp" method="post">

        <label>Select Membership Plan</label>

        <select name="fee_id" required>

            <option value="">-- Select Plan --</option>

<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {

    conn = DBConnection.getConnection();

    String sql = "SELECT * FROM fees";

    pstmt = conn.prepareStatement(sql);

    rs = pstmt.executeQuery();

    while (rs.next()) {

%>

            <option value="<%= rs.getInt("id") %>">

                <%= rs.getString("plan_name") %>
                -
                <%= rs.getString("duration") %>
                -
              &#8377;<%= rs.getDouble("amount") %>

            </option>

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

        </select>

        <button type="submit">
            Register Membership
        </button>

    </form>

    <a class="back" href="userDashboard.jsp">
        Back to Dashboard
    </a>

</div>

</body>

</html>