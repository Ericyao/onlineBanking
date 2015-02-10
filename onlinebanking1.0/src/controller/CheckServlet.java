package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import jdbcConnection.TimeDeposit;
import jdbcConnection.TimeDepositDAOimpl;

/**
 * Servlet implementation class CheckServlet
 */
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		//String username = request.getParameter("Update_username");
		
		String checknum = request.getParameter("checknum");
		
		System.out.println("checksum"+checknum);
		TimeDepositDAOimpl udi = new TimeDepositDAOimpl();
		TimeDeposit timedeposit = null;
		String  currency = null;
		Date begin = null;
		Date end = null;
		double amount = 0;
		String damount = null;
		try {
			timedeposit = udi.ShowTimeDepositINF(checknum);	
			currency = timedeposit.getTcurrency();
			begin = timedeposit.getTbegin();
			end = timedeposit.getTdeadline();
			amount = timedeposit.getTbalanceb();
			damount = String.valueOf(amount);
			if (timedeposit == null) {
				PrintWriter out = response.getWriter();
				out.println("can not find timedopist information");
				//response.setHeader("Refresh","2;URL=./maintain.jsp");
				return;
			// request.setAttribute("SigninFailMsg", "Please check your inputs!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    //return;
		}
		System.out.println("update ok");
		//request.getSession().setAttribute("SigninUser", signinUser);
		request.setAttribute( "currency",currency);
		request.getSession().setAttribute ("checknum", checknum);
		request.setAttribute("begin", begin);
		request.setAttribute("end", end);
		request.setAttribute("amount", damount);
		request.getRequestDispatcher("deposit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
