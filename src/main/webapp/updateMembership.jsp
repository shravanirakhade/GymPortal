<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
Integer userId = (Integer) session.getAttribute("userId");

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
        "SELECT m.id, m.fee_id, f.plan_name, f.duration, f.amount " +
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

<title>Update Membership</title>

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
    background: #2563eb;
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

<h2>Update Membership</h2>

<%

if (rs.next()) {

    int membershipId = rs.getInt("id");
    int currentFeeId = rs.getInt("fee_id");

%>

<form action="saveMembershipUpdate.jsp" method="post">

    <input type="hidden"
           name="membership_id"
           value="<%= membershipId %>">

    <label>Select New Membership Plan</label>

    <select name="fee_id" required>

<%

    PreparedStatement feeStmt = null;
    ResultSet feeRs = null;

    try {

        feeStmt = conn.prepareStatement("SELECT * FROM fees");
        feeRs = feeStmt.executeQuery();

        while (feeRs.next()) {

%>

        <option value="<%= feeRs.getInt("id") %>"
            <%= feeRs.getInt("id") == currentFeeId ? "selected" : "" %>>

            <%= feeRs.getString("plan_name") %>
            -
            <%= feeRs.getString("duration") %>
            -
            &#8377;<%= rs.getDouble("amount") %>

        </option>

<%

        }

    } finally {

        if (feeRs != null) feeRs.close();
        if (feeStmt != null) feeStmt.close();

    }

%>

    </select>

    <button type="submit">
        Update Membership
    </button>

</form>

<%

} else {

%>

    <p style="text-align:center;">
        You don't have a membership to update.
    </p>

<%

}

%>

<a class="back" href="myMembership.jsp">
    Back to My Membership
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