<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>
<%
String name = (String) session.getAttribute("name");
String role = (String) session.getAttribute("role");

if (name == null || !"user".equals(role)) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%
String membershipPlan = "No Membership";
String membershipStatus = "Not Registered";
double membershipFee = 0;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {

    Integer userId = (Integer) session.getAttribute("userId");

    conn = DBConnection.getConnection();

    String sql =
        "SELECT f.plan_name, f.amount, m.status " +
        "FROM memberships m " +
        "JOIN fees f ON m.fee_id = f.id " +
        "WHERE m.user_id = ? " +
        "ORDER BY m.id DESC LIMIT 1";

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, userId);

    rs = pstmt.executeQuery();

    if (rs.next()) {

        membershipPlan = rs.getString("plan_name");
        membershipFee = rs.getDouble("amount");
        membershipStatus = rs.getString("status");
    }

} catch (Exception e) {

    e.printStackTrace();

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
<!DOCTYPE html>
<html>
<head>

<title>Gym Portal - User Dashboard</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f5f6fa;
}

/* Header */

.header {
    background: #1f2937;
    color: white;
    padding: 18px 35px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 24px;
    font-weight: bold;
}

.user-area {
    display: flex;
    align-items: center;
    gap: 20px;
}

.logout {
    background: #ef4444;
    color: white;
    padding: 10px 18px;
    text-decoration: none;
    border-radius: 6px;
}

/* Main */

.container {
    padding: 35px;
}

.welcome {
    margin-bottom: 30px;
}

.welcome h1 {
    font-size: 32px;
    margin-bottom: 8px;
}

.welcome p {
    color: #777;
}

/* Cards */

.cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.card {
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.card-icon {
    font-size: 30px;
    margin-bottom: 15px;
}

.card h3 {
    color: #555;
    margin-bottom: 10px;
}

.card-value {
    font-size: 25px;
    font-weight: bold;
}

/* Quick Actions */

.quick-title {
    margin-top: 40px;
    margin-bottom: 20px;
}

.actions {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.action {
    background: white;
    padding: 25px;
    border-radius: 10px;
    text-decoration: none;
    color: #222;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    transition: 0.2s;
}

.action:hover {
    transform: translateY(-3px);
}

.action-icon {
    font-size: 30px;
    margin-bottom: 12px;
}

.action h3 {
    margin-bottom: 8px;
}

.action p {
    color: #777;
}

</style>

</head>

<body>

<!-- Header -->

<div class="header">

    <div class="logo">
        🏋️ Universal Fitness
    </div>

    <div class="user-area">

        <span>
            Hi, <%= name %> 👋
        </span>

        <a class="logout" href="logout.jsp">
            Logout
        </a>

    </div>

</div>


<!-- Main -->

<div class="container">

    <div class="welcome">

        <h1>Welcome back, <%= name %>!</h1>

        <p>Manage your Universal Fitness membership.</p>

    </div>


    <!-- Information Cards -->

    <div class="cards">

        <div class="card">

            <div class="card-icon">👥</div>

            <h3>My Registration</h3>

          <div class="card-value">
    <%= membershipStatus %>
</div>

        </div>


        <div class="card">

            <div class="card-icon">🏋️</div>

            <h3>My Membership</h3>

           <div class="card-value">
    <%= membershipPlan %>
</div>
        </div>


        <div class="card">

            <div class="card-icon">💰</div>

            <h3>My Fees</h3>

           <div class="card-value">

<%
if (membershipFee > 0) {
%>

    &#8377;<%= membershipFee %>

<%
} else {
%>

    No Fees

<%
}
%>

</div>

        </div>

    </div>


    <!-- Quick Actions -->

    <h2 class="quick-title">
        Quick Actions
    </h2>


    <div class="actions">

        <a class="action-card" href="registerMembership.jsp">
    <div class="action-icon">📝</div>
    <h3>Register Membership</h3>
    <p>Choose your gym plan</p>
</a>


      <a class="action" href="myMembership.jsp">

    <div class="action-icon">👤</div>

    <h3>My Membership</h3>

    <p>View or manage your record</p>

</a>


        <a class="action" href="fees.jsp">
            <div class="action-icon">💰</div>
            <h3>Fee Structure</h3>
            <p>View all membership plans</p>
        </a>


       <a class="action" href="myFacilities.jsp">

    <div class="action-icon">🏋️</div>

    <h3>My Facilities</h3>

    <p>See facilities available to you</p>

</a>

    </div>

</div>

</body>
</html>