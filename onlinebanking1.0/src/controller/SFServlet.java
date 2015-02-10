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
import jdbcConnection.HistoryBean;
import jdbcConnection.TimeDepositDAOimpl;
import jdbcConnection.User;
import jdbcConnection.UserDAOimpl;

/**
 * Servlet implementation class SFTServlet
 */
public class SFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SFServlet() {
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
		String fromnum = request.getParameter("fromnum");
		String tonum =request.getParameter("tonum");
		String Amount = request.getParameter("Amount");
		boolean bigger= false;
		//String transfertonum = null;
		//initial them
		System.out.println("1"+fromnum);System.out.println("2"+tonum);System.out.println("3"+Amount);
		double damount = Double.parseDouble(Amount);
		//int itime = Integer.parseInt(time);
		AcctDAOimpl acct = new AcctDAOimpl();
		int referenceno = 0;
		
		System.out.println("Begin transfer");
		try {	
				if(acct.ifExit(tonum)==false){
					response.setHeader("Refresh","0;URL=./OPerror.jsp");
				}else{
				bigger =acct.moneyTransfer(tonum, fromnum, damount);
				if(bigger!=true){
					response.setHeader("Refresh","0;URL=./OPerror.jsp");
				}else
				referenceno = acct.writeHistory(tonum, fromnum, damount);
				}
				//System.out.println("Transfer good!");
			// request.setAttribute("SigninFailMsg", "Please check your inputs!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    //return;
		}
		
		request.setAttribute( "ffromnum",fromnum);
		request.setAttribute("ftonum", tonum);
		request.setAttribute("famount", Amount);
		request.setAttribute("referenceno", String.valueOf(referenceno));
		//request.setAttribute("transferAmount",amount);
		request.getRequestDispatcher("downmemotrf.jsp").forward(request, response);
		//response.sendRedirect("downmemodep.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
