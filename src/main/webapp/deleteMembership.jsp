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

try {

    conn = DBConnection.getConnection();

    String sql = "DELETE FROM memberships WHERE user_id=?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, userId);

    pstmt.executeUpdate();

    response.sendRedirect("userDashboard.jsp");

} catch (Exception e) {

    out.println("<h3>Error: " + e.getMessage() + "</h3>");

} finally {

    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>