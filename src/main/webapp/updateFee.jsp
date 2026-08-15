<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

String planName = request.getParameter("plan_name");
String duration = request.getParameter("duration");
double amount = Double.parseDouble(request.getParameter("amount"));
String facilities = request.getParameter("facilities");

Connection conn = null;
PreparedStatement pstmt = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/gymdb",
        "root",
        "YOUR_PASSWORD"
    );

    String sql = "UPDATE fees SET plan_name=?, duration=?, amount=?, facilities=? WHERE id=?";

    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, planName);
    pstmt.setString(2, duration);
    pstmt.setDouble(3, amount);
    pstmt.setString(4, facilities);
    pstmt.setInt(5, id);

    int result = pstmt.executeUpdate();

    if (result > 0) {
        response.sendRedirect("adminFees.jsp");
    } else {
        out.println("<h3>Fee plan could not be updated.</h3>");
    }

} catch(Exception e) {

    out.println("<h3>Error: " + e.getMessage() + "</h3>");

} finally {

    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
}
%>