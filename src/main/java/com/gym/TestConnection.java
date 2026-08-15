package com.gym;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            System.out.println("SUCCESS: Database connection is working!");
        } else {
            System.out.println("FAILED: Database connection is not working!");
        }
    }
}