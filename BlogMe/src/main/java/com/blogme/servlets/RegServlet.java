package com.blogme.servlets;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.blogme.dao.UserDao;
import com.blogme.entities.User;
import com.blogme.helper.ConnectionProvider;

@MultipartConfig
public class RegServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String check=req.getParameter("check");
		
		if (check==null) {
			resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
			out.println("Please agree to Terms and Conditions");
		} else {
			//Code for data insertion
			String name=req.getParameter("user_name");
			String email=req.getParameter("user_email");
			String password=req.getParameter("user_password");
			String gender=req.getParameter("gender");
			
//			create a user object to fill data
			User user=new User(name,email,password,gender);
			
			
			//create user dao object
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if (dao.saveUser(user)) {
			    resp.setStatus(HttpServletResponse.SC_OK); // 200 OK
			    resp.setContentType("text/html");
			    PrintWriter out = resp.getWriter();
			    out.println("Data Submitted");
			} else {
			    resp.setStatus(HttpServletResponse.SC_CONFLICT); // 409 Conflict or appropriate code
			    resp.setContentType("text/html");
			    PrintWriter out = resp.getWriter();
			    out.println("Error submitting data..!!");
			}

		}
		
	}
	
}
