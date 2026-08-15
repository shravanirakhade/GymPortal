package com.gym;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String role = rs.getString("role");

                // Create Session
                HttpSession session = request.getSession();

                session.setAttribute("userId", userId);
                session.setAttribute("username", username);
                session.setAttribute("name", name);
                session.setAttribute("role", role);

                // Check role
                if (role.equals("admin")) {

                    response.sendRedirect("adminDashboard.jsp");

                } else {

                    response.sendRedirect("userDashboard.jsp");
                }

            } else {

                response.getWriter().println("Invalid Username or Password");

            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}