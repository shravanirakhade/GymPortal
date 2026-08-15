<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection conn = null;
PreparedStatement pstmt = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/gymdb",
        "root",
        "YOUR_PASSWORD"
    );

    String sql = "DELETE FROM fees WHERE id=?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, id);

    int result = pstmt.executeUpdate();

    if (result > 0) {
        response.sendRedirect("adminFees.jsp");
    } else {
        out.println("<h3>Fee plan could not be deleted.</h3>");
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