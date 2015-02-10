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
public class verifyfy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyfy() {
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
		String fromnum = request.getParameter("Stransferfromnum");
		String tonum =request.getParameter("Stransfertonum");
		String Amount = request.getParameter("StransferAmount");
		//String transfertonum = null;
		//initial them
		System.out.println(tonum);
		//int itime = Integer.parseInt(time);
		AcctDAOimpl acct = new AcctDAOimpl();
		String name = null;
		System.out.println("!!!!!!"+fromnum+tonum+Amount);
		
		try {	
				name = acct.viewUserName(tonum);
				System.out.println("name"+name);
				
		} catch (Exception e) {
			response.setHeader("Refresh","0;URL=./TOPerror.jsp");
		    //return;
		}
		System.out.println("namename = "+ name);
		request.setAttribute( "1fromnum",fromnum);
		request.setAttribute("2tonum", tonum);
		request.setAttribute("3amount", Amount);
		request.setAttribute("4name",name);
		//request.setAttribute("transferName",name);
		request.getRequestDispatcher("SFVerify.jsp").forward(request, response);
		//response.sendRedirect("downmemodep.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
