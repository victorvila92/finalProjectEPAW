package controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.HtmlUtils;
import utils.PostUtils;
import utils.UserUtils;
import models.BeanPost;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<BeanPost> postList = new ArrayList<BeanPost>();
		try {
				ResultSet allPosts = PostUtils.getAllPosts();
					
					while (allPosts.next()){
							
							BeanPost post = new BeanPost();
							post.setId(allPosts.getInt("id"));
							post.setAuthor(allPosts.getString("author"));
							post.setTitle(allPosts.getString("title"));
							post.setContent(allPosts.getString("content"));
							post.setEventime(allPosts.getString("eventime"));
							post.setPlace(allPosts.getString("place"));
							post.setLikes(allPosts.getInt("likes"));
							post.setPostime(allPosts.getString("time"));
					        postList.add(post);
					    }
			
				} catch (Exception e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		request.setAttribute("postList",postList);
		dispatcher.forward(request, response);	
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
