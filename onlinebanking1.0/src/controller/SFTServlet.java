//作为 saving 和 foreign传钱到储蓄的操作
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbcConnection.AcctBean;
import jdbcConnection.AcctDAOimpl;
import jdbcConnection.TimeDepositDAOimpl;
import jdbcConnection.User;
import jdbcConnection.UserDAOimpl;

/**
 * Servlet implementation class SFTServlet
 */
public class SFTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SFTServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//String username = (String)session.getAttribute("Metrousername");
		//System.out.println(username);
		//Get the information we need
		String transferfromnum = request.getParameter("transferfromnum");
		String amount =request.getParameter("transferAmount");
		String time = request.getParameter("DepositTime");
		String transfertonum = null;
		//initial them
		System.out.println(amount);System.out.println(time);System.out.println(transferfromnum);
		double damount = Double.parseDouble(amount);
		//int itime = Integer.parseInt(time);
		AcctDAOimpl acct = new AcctDAOimpl();
		TimeDepositDAOimpl tacct = new TimeDepositDAOimpl();
		double afdamount = 0;
		double oribalance = 0;
		double cha = 0;
		System.out.println("Begin transfer");
		try {	
				
				oribalance= acct.viewBalance(transferfromnum);
				 afdamount = tacct.CalTbalanceEA(damount, time);
				 transfertonum = acct.showToacct(transferfromnum);
				 
			// request.setAttribute("SigninFailMsg", "Please check your inputs!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    //return;
		}
		if(oribalance>damount){
			cha = oribalance-damount;
		
		try{
			
			tacct.addBalance(transferfromnum, time, damount, afdamount);
			acct.minusBalance(transferfromnum, cha);
			System.out.println("Operation!");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		}else{
			response.setHeader("Refresh","0;URL=./OPerror.jsp");
		};
		System.out.println("TimeDeposit Transfer good");
		//request.getSession().setAttribute("SigninUser", signinUser);
		System.out.println(transferfromnum+amount+time);
		try{
			tacct.SFTwriteHistory(transfertonum, transferfromnum, damount);
		}catch(Exception e){
			System.out.println("Write histroy problem!");
		}
		request.setAttribute( "transfernum",transferfromnum);
		request.setAttribute("Amout", amount);
		request.setAttribute("TDmemotime", time);
		//request.setAttribute("transferAmount",amount);
		request.getRequestDispatcher("downmemodep.jsp").forward(request, response);
		//response.sendRedirect("downmemodep.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
