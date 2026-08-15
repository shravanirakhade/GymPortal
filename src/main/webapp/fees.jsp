<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<title>Fee Structure - Universal Fitness</title>

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
    padding: 35px;
}

.title {
    text-align: center;
    margin-bottom: 30px;
}

.fees {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.fee-card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.fee-card h2 {
    margin-top: 0;
}

.duration {
    color: #777;
}

.amount {
    font-size: 28px;
    font-weight: bold;
    margin: 15px 0;
}

.facilities {
    margin-top: 15px;
}

.details {
    margin-top: 20px;
    padding: 10px 15px;
    background: #1f2937;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    display: inline-block;
}

</style>

</head>

<body>

<div class="header">

    <h2>🏋️ Universal Fitness</h2>

    <a class="back" href="userDashboard.jsp">
        Back to Dashboard
    </a>

</div>


<div class="container">

    <div class="title">
        <h1>Fee Structure</h1>
        <p>Choose the membership plan that suits you</p>
    </div>


    <div class="fees">

<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {

    conn = DBConnection.getConnection();

    String sql = "SELECT * FROM fees";

    pstmt = conn.prepareStatement(sql);

    rs = pstmt.executeQuery();

    while(rs.next()) {

        int id = rs.getInt("id");
        String planName = rs.getString("plan_name");
        String duration = rs.getString("duration");
        double amount = rs.getDouble("amount");
        String facilities = rs.getString("facilities");

%>

        <div class="fee-card">

            <h2><%= planName %></h2>

            <p class="duration">
                <%= duration %>
            </p>

            <div class="amount">
    &#8377;<%= amount %>
</div>

            <div class="facilities">

                <strong>Facilities:</strong>

                <p>
                    <%= facilities %>
                </p>

            </div>

            <a class="details"
               href="feeDetails.jsp?id=<%= id %>">

                Show Details

            </a>

        </div>

<%

    }

} catch(Exception e) {

    out.println("<p>Error: " + e.getMessage() + "</p>");

} finally {

    try {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    } catch(Exception e) {
        e.printStackTrace();
    }

}

%>

    </div>

</div>

</body>
</html>