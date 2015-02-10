package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbcConnection.User;
import jdbcConnection.UserDAOimpl;

/**
 * Servlet implementation class UpdateINF
 */
public class UpdateINF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateINF() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		//String username = request.getParameter("Update_username");
		HttpSession session = request.getSession();
		 String username = (String)session.getAttribute("Username");
		System.out.println(username);
		String password = request.getParameter("Update_password");
		String telephone = request.getParameter("Update_telephone");
		String address =  request.getParameter("Update_address");
		System.out.println(password+telephone+address);
		UserDAOimpl udi = new UserDAOimpl();
		User signinUser = null;
		try {
			udi.updateINF(password,telephone,address,username);	
			
			// request.setAttribute("SigninFailMsg", "Please check your inputs!");
			
		} catch (Exception e) {
			response.setHeader("Refresh","0;URL=./OPerror.jsp");
		    //return;
		}
		System.out.println("update ok");
		//request.getSession().setAttribute("SigninUser", signinUser);
		//request.setAttribute( "Updatename",username);//´æÖµ
		//request.getRequestDispatcher("info.jsp").forward(request, response);
		//response.sendRedirect("metro.jsp");
		response.setHeader("Refresh","0;URL=./info.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
