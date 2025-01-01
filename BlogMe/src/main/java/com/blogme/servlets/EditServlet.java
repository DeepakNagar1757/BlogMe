package com.blogme.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blogme.dao.UserDao;
import com.blogme.entities.Message;
import com.blogme.entities.User;
import com.blogme.helper.ConnectionProvider;
import com.blogme.helper.Helper;
import com.mysql.cj.conf.BooleanPropertyDefinition.AllowableValues;
import com.mysql.cj.x.protobuf.MysqlxCursor.Fetch;
@MultipartConfig
public class EditServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Fetch all data
		String userEmail=req.getParameter("user_email");
		String userName=req.getParameter("user_name");
		String userPassword=req.getParameter("user_password");
		Part part=req.getPart("image");
		String imgName=part.getSubmittedFileName();
		
//		getting old values using user session
		
		HttpSession s=req.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		String oldFile=user.getProfile();
		user.setProfile(imgName);
		
//		update user database 
		UserDao userDao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userDao.updateUser(user);
		if (ans) {
			
			

			String path=req.getRealPath("/")+"profile_pics"+File.separator+user.getProfile();
			System.out.println(path);
			
			String pathOldFile=req.getRealPath("/")+"profile_pics"+File.separator+oldFile;
			
			if (!oldFile.equals("default.png")) {
				Helper.deleteFile(pathOldFile);
			}
			
			
				if(Helper.saveFile(part.getInputStream(), path)) {
					resp.setContentType("text/html");
					PrintWriter out=resp.getWriter();
					out.println("Profile Updated.....!!");
					Message msg=new Message("Profile Updated.....!!","success","alert-success");
					s.setAttribute("msg", msg);
				}else {
					resp.setContentType("text/html");
					PrintWriter out=resp.getWriter();
					out.println("Profile not Updated.....!!");
					Message msg=new Message("Something went Wrong.....!!","rrror","alert-danger");
					s.setAttribute("msg", msg);
				}
			}
		else{
			resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
			out.println("not updated..");
			Message msg=new Message("Something went Wrong.....!!","rrror","alert-danger");
			s.setAttribute("msg", msg);
			out.println("</body>");
			out.println("</html>");
		}
		resp.sendRedirect("profile.jsp");
	}
}
