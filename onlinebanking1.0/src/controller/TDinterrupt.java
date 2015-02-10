package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbcConnection.AcctDAOimpl;
import jdbcConnection.TimeDepositDAOimpl;

/**
 * Servlet implementation class TDinterrupt
 */
public class TDinterrupt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TDinterrupt() {
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
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("Metrousername");
		String checknum = (String)session.getAttribute("checknum");
		System.out.println(checknum);
		System.out.println("jinlaile!");
		//String transfertonum = request.getParameter("transfertonum");
		//String amount =request.getParameter("transferAmount");
		//String time = request.getParameter("DepositTime");
		double tbalanceeb = 0;
		AcctDAOimpl acct = new AcctDAOimpl();
		TimeDepositDAOimpl tacct = new TimeDepositDAOimpl();
		double afdamount = 0;
		double oribalance = 0;
		
		try {	
				 oribalance= acct.viewBalance(checknum);
				 tbalanceeb = tacct.showBalanceEB(checknum);
				 System.out.println("1"+oribalance+"2"+tbalanceeb);
				 afdamount = oribalance + tbalanceeb;
				 tacct.minusBalance(checknum);
				 acct.addBalance(checknum, afdamount);
				 
				 
				//System.out.println("Transfer good!");
			// request.setAttribute("SigninFailMsg", "Please check your inputs!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    //return;
		}
		
		
		//System.out.println("TimeDeposit Transfer good");
		//request.getSession().setAttribute("SigninUser", signinUser);
		//request.setAttribute( "transferfromnum",transferfromnum);
		//request.setAttribute("transfertonum",transfertonum);//´æÖµ
		request.setAttribute("Metrousername",username);
		request.getRequestDispatcher("metro.jsp").forward(request, response);
		//response.sendRedirect("metro.jsp");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
