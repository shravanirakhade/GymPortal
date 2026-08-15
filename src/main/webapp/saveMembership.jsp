<%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
Integer userId = (Integer) session.getAttribute("userId");

if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}

String feeIdStr = request.getParameter("fee_id");

if (feeIdStr == null || feeIdStr.trim().isEmpty()) {
    response.sendRedirect("registerMembership.jsp");
    return;
}

int feeId = Integer.parseInt(feeIdStr);

Connection conn = null;
PreparedStatement pstmt = null;

try {

    conn = DBConnection.getConnection();

    String sql = "INSERT INTO memberships (user_id, fee_id, registration_date, status) VALUES (?, ?, CURDATE(), ?)";

    pstmt = conn.prepareStatement(sql);

    pstmt.setInt(1, userId);
    pstmt.setInt(2, feeId);
    pstmt.setString(3, "Active");

    pstmt.executeUpdate();

    response.sendRedirect("userDashboard.jsp");

} catch (Exception e) {

    out.println("<h2>Membership Registration Error</h2>");
    out.println("<p>" + e.getMessage() + "</p>");

} finally {

    try {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>