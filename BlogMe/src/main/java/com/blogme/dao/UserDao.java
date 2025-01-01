package com.blogme.dao;

import java.sql.*;

import org.apache.catalina.tribes.group.interceptors.FragmentationInterceptor;

import com.blogme.entities.User;
import com.mysql.cj.jdbc.BlobFromLocator;
public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
//	Methods to put user data into database
	
	public boolean saveUser(User user) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			//Use --> Database
			String Query="insert into user(name,email,password,gender) value(?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(Query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			
			pstmt.executeUpdate();
			
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	  // Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        String query = "SELECT * FROM user WHERE email = ? AND password = ?"; // Check for both

        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password); // Direct comparison

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
                user.setIdUser(set.getInt("idUser"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password")); // Still plaintext
                user.setGender(set.getString("gender"));
                user.setProfile(set.getString("profile"));
            } else {
                System.out.println("No user found with the provided email.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String Q = "UPDATE user SET name=?, email=?, password=?, profile=? WHERE idUser=?";
            PreparedStatement p = con.prepareStatement(Q);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getProfile()); // Don't forget to set the profile image
            p.setInt(5, user.getIdUser());

            int rowsAffected = p.executeUpdate();  // Returns the number of affected rows
            if (rowsAffected > 0) {
                f = true;  // If at least one row was updated, set f to true
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;  // Return true if update succeeded, false otherwise
    }

    
    
}
