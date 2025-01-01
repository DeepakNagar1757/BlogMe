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

import com.blogme.dao.PostDao;
import com.blogme.entities.Post;
import com.blogme.entities.User;
import com.blogme.helper.ConnectionProvider;
import com.blogme.helper.Helper;
import com.mysql.cj.Session;

@MultipartConfig
public class AddPostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cid=Integer.parseInt(req.getParameter("cid"));
		String pTitle=req.getParameter("ptitle");
		String pContent=req.getParameter("pcontent");
		String pCode=req.getParameter("pcode");
		Part part=req.getPart("pic");
		
		//Getting user id using session
		HttpSession session=req.getSession();
		User user=(User) session.getAttribute("currentUser");
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		//out.println("Title :"+ pTitle);
		//out.println(part.getSubmittedFileName());
		
		Post p=new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getIdUser());
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		if (dao.savePost(p)) {
            // Define the path to save images, using an explicit folder (WebContent/Post_pics)
            String imageFolder = "C:\\Users\\DELL\\eclipse-workspace\\BlogMe\\WebContent\\Post_pics";
            File uploadDir = new File(imageFolder);

            // Ensure the directory exists, otherwise create it
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create directories if they don't exist
            }

            // Define the file path to save the uploaded image
            String filePath = imageFolder + File.separator + part.getSubmittedFileName();

            // Save the uploaded file to the specified path
            Helper.saveFile(part.getInputStream(), filePath);

		}else {
			out.println("Error......!!!");	
		}
		
		
		
		
		
		
		
	}
	
}
