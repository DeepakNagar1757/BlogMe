package com.blogme.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blogme.entities.Message;

public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s=req.getSession();
		s.removeAttribute("currentUser");
		Message m=new Message("Logout Successfully", "success","alert-success");
		s.setAttribute("msg", m);
		resp.sendRedirect("login_page.jsp");
	}

	
	
}
