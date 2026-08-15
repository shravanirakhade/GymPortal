<%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
String name = (String) session.getAttribute("name");
String role = (String) session.getAttribute("role");

if (name == null || !"admin".equals(role)) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Fee Structure</title>

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

.header a {
    color: white;
    text-decoration: none;
    background: #374151;
    padding: 10px 15px;
    border-radius: 6px;
}

.container {
    padding: 35px;
}

h1 {
    margin-bottom: 25px;
}

.add-btn {
    display: inline-block;
    background: #16a34a;
    color: white;
    text-decoration: none;
    padding: 12px 18px;
    border-radius: 6px;
    margin-bottom: 20px;
}

table {
    width: 100%;
    background: white;
    border-collapse: collapse;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

th, td {
    padding: 15px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

th {
    background: #1f2937;
    color: white;
}

.edit {
    background: #2563eb;
    color: white;
    padding: 8px 12px;
    text-decoration: none;
    border-radius: 5px;
}

.delete {
    background: #dc2626;
    color: white;
    padding: 8px 12px;
    text-decoration: none;
    border-radius: 5px;
}

</style>

</head>

<body>

<div class="header">

    <h2>🏋️ Universal Fitness - Admin</h2>

    <a href="adminDashboard.jsp">
        Dashboard
    </a>

</div>


<div class="container">

    <h1>Manage Fee Structure</h1>

    <a class="add-btn" href="addFee.jsp">
        + Add New Fee Plan
    </a>


    <table>

        <tr>

            <th>ID</th>
            <th>Plan</th>
            <th>Duration</th>
            <th>Amount</th>
            <th>Facilities</th>
            <th>Actions</th>

        </tr>

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

        <tr>

            <td>
                <%= rs.getInt("id") %>
            </td>

            <td>
                <%= rs.getString("plan_name") %>
            </td>

            <td>
                <%= rs.getString("duration") %>
            </td>

            <td>
                ₹<%= rs.getDouble("amount") %>
            </td>

            <td>
                <%= rs.getString("facilities") %>
            </td>

            <td>

                <a class="edit"
                   href="editFee.jsp?id=<%= rs.getInt("id") %>">
                   Edit
                </a>

                <a class="delete"
                   href="deleteFee.jsp?id=<%= rs.getInt("id") %>"
                   onclick="return confirm('Are you sure you want to delete this fee plan?');">
                   Delete
                </a>

            </td>

        </tr>

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

    </table>

</div>

</body>

</html>