<%@ page import="java.sql.*" %>

<%
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

    String sql = "INSERT INTO fees (plan_name, duration, amount, facilities) VALUES (?, ?, ?, ?)";

    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, planName);
    pstmt.setString(2, duration);
    pstmt.setDouble(3, amount);
    pstmt.setString(4, facilities);

    pstmt.executeUpdate();

    response.sendRedirect("adminFees.jsp");

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