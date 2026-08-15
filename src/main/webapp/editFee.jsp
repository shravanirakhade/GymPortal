<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String planName = "";
String duration = "";
double amount = 0;
String facilities = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/gymdb",
        "root",
        "YOUR_PASSWORD"
    );

    pstmt = conn.prepareStatement("SELECT * FROM fees WHERE id=?");
    pstmt.setInt(1, id);

    rs = pstmt.executeQuery();

    if (rs.next()) {
        planName = rs.getString("plan_name");
        duration = rs.getString("duration");
        amount = rs.getDouble("amount");
        facilities = rs.getString("facilities");
    }

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Fee Plan</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            padding: 40px;
        }

        .container {
            width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            margin-top: 20px;
            padding: 12px 25px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Edit Fee Plan</h2>

    <form action="updateFee.jsp" method="post">

        <input type="hidden" name="id" value="<%= id %>">

        <label>Plan Name</label>
        <input type="text" name="plan_name"
               value="<%= planName %>" required>

        <label>Duration</label>
        <input type="text" name="duration"
               value="<%= duration %>" required>

        <label>Amount</label>
        <input type="number" step="0.01" name="amount"
               value="<%= amount %>" required>

        <label>Facilities</label>
        <textarea name="facilities" required><%= facilities %></textarea>

        <button type="submit">Update Fee Plan</button>

    </form>

</div>

</body>
</html>

<%
if (rs != null) rs.close();
if (pstmt != null) pstmt.close();
if (conn != null) conn.close();
%>