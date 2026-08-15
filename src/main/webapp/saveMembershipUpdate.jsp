<%@ page import="java.sql.*" %>
<%@ page import="com.gym.DBConnection" %>

<%
Integer userId = (Integer) session.getAttribute("userId");

if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}

String membershipIdStr = request.getParameter("membership_id");
String feeIdStr = request.getParameter("fee_id");

if (membershipIdStr == null || feeIdStr == null) {
    response.sendRedirect("myMembership.jsp");
    return;
}

int membershipId = Integer.parseInt(membershipIdStr);
int feeId = Integer.parseInt(feeIdStr);

Connection conn = null;
PreparedStatement pstmt = null;

try {

    conn = DBConnection.getConnection();

    /*
     * Update only the membership belonging
     * to the currently logged-in user.
     */
    String sql =
        "UPDATE memberships SET fee_id=? " +
        "WHERE id=? AND user_id=?";

    pstmt = conn.prepareStatement(sql);

    pstmt.setInt(1, feeId);
    pstmt.setInt(2, membershipId);
    pstmt.setInt(3, userId);

    int result = pstmt.executeUpdate();

    if (result > 0) {

        response.sendRedirect("myMembership.jsp");

    } else {

        out.println("<h3>Membership could not be updated.</h3>");
    }

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