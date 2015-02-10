<%@ page language="java" contentType="application/msexcel; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "jdbcConnection.*" %>
<%@page import = "java.util.Date" %>
<%@page import = "java.text.*" %>
<%
response.setHeader("Content-disposition","attachment; filename=memo.xls"); 
%>

<!DOCTYPE>
<html>
<head>

</head>
<body>
<% 										
    	String from =(String)request.getParameter("fffrom");
    	String to =(String) request.getParameter("ftonum");
    	String amount = (String)request.getParameter("famount"); 
    	String referenceno = (String)request.getParameter("referenceno"); 
    	AcctDAOimpl ad = new AcctDAOimpl();
    	String typeFrom = ad.viewAcctType(from);
    	String typeTo = ad.viewAcctType(to);
    	Date d = new Date();
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String date = fmt.format(d);
%>

<table border="2" width="100%">
	<tr>
      <td>ReferenceNo</td><td><%out.print(referenceno); %> 
    </tr>
    <tr>
      <td>From Account</td><td><%out.print(from); %></td>
    </tr>
    <tr>
      <td>To Account</td><td><%out.print(to); %></td>
    </tr>
    <tr>
      <td>Amount</td><td><%out.print(amount); %></td>
    </tr>
    <tr>
      <td>Transfer Type</td><td><%out.print(typeFrom + " to " + typeTo); %></td>
    </tr>
    <tr>
      <td>Date</td><td><%out.print(date); %></td>
    </tr>
   
  </table>
</body>
</html>