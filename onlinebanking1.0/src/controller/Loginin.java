package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import jdbcConnection.*;
/**
 * Servlet implementation class SigninSVL
 */
public class Loginin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("login_username");
		String password = request.getParameter("login_password");
		
		UserDAOimpl udi = new UserDAOimpl();
		User signinUser = null;
		try {
			signinUser = udi.signin(username, password);	
			if (signinUser == null) {
				PrintWriter out = response.getWriter();
				//out.println("Please check your username and password");
				response.setHeader("Refresh","0;URL=./loginer.jsp");
				return;
			// request.setAttribute("SigninFailMsg", "Please check your inputs!");
			}else{
				//get date
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String currentdate=df.format(new Date());
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    //return;
		}
		System.out.println(username);
       //request.setAttribute( "Loginusername",username);//存值
		request.getSession().setAttribute("Username", username);
		request.getRequestDispatcher("metro.jsp").forward(request, response);
		//response.sendRedirect("home.jsp");
		/*User signinUser = new User();	
		signinUser.setEmail(email);			
		signinUser.setPassword(password);
*/		
	
		
		/*
		 * 1. 匹配用户密码-》不存在“不存在该用户”；密码错误“密码错误” 
		 * 2. 调用ShowAllTweetsSVL，返回TweetsList
		 * 3. 返回User 及 TweetsList 跳转至 home。jsp
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}