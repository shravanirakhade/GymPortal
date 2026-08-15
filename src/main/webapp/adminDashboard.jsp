<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <title>Gym Portal - Admin Dashboard</title>
</head>

<body>

<h1>Welcome Admin, <%= name %>!</h1>

<p>Role: <%= role %></p>

<hr>

<h2>Admin Actions</h2>

<a href="adminFees.jsp">Manage Fee Structure</a>
<br><br>

<a href="logout.jsp">Logout</a>

</body>
</html>