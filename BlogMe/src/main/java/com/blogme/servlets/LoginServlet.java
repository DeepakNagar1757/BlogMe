package com.blogme.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import com.blogme.dao.UserDao;
import com.blogme.entities.Message;
import com.blogme.entities.User;
import com.blogme.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		fetching user email and password from request....
		String userEmail=req.getParameter("email");
		String userPassword=req.getParameter("password");

		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if (u==null) {
//////			login error
////			resp.setContentType("text/html");
////			PrintWriter out=resp.getWriter();
////			out.println("Invalid Credentials...please try again.!!");
////			System.out.println("Email: " + userEmail);
////			System.out.println("Password: " + userPassword);
//			
				Message msg=new Message("Invalid Credentials,Try again..!!","Error","alert-danger");
				resp.sendRedirect("login_page.jsp");
				HttpSession s=req.getSession();
				s.setAttribute("msg", msg);
		} else {
			HttpSession session=req.getSession();
			session.setAttribute("currentUser", u);
			resp.sendRedirect("profile.jsp");
		}
		
	}

}
