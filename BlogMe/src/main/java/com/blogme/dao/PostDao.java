package com.blogme.dao;
import java.sql.*;
import java.util.ArrayList;
import com.blogme.entities.Catagory;
import com.blogme.entities.Post;
public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Catagory> getAllCategories(){
		ArrayList<Catagory> list=new ArrayList<>();
		
		try {
			
			String Q="select * from catagories";
			Statement stmt=con.createStatement();
			ResultSet set=stmt.executeQuery(Q);
			while(set.next()) {
				int cid=set.getInt("idcatagories");
				String name=set.getString("name");
				String description=set.getString("description");
				Catagory c=new Catagory(cid,name,description);
				list.add(c);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;	
	}
	
	public boolean savePost(Post p) {
		boolean f=false;
		
		try {
			
			String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
}
