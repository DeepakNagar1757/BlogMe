package com.blogme.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {

		try {

			if (con == null) {

				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Blogme", "root", "Deepak_1757");

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return con;
	}
}
