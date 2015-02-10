<%@ page language="java" contentType="application/msexcel; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "jdbcConnection.*" %>

<%
response.setHeader("Content-disposition","attachment; filename=memo.xls"); 
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 										
    	String from =(String)request.getParameter("fffrom");
    	String time =(String) request.getParameter("ftime");
    	String amount = (String)request.getParameter("famount"); 
    	
    	System.out.println("SDfrom+amount+time"+from+amount+time);
    	HistoryBean ab = new HistoryBean();
    	int rno = ab.getReferenceNo();
%>

<table border="1" width="100%">
	<tr>
      <td>ReferenceNo</td><td><%out.print(rno); %><td>rno</td>
    </tr>
    <tr>
      <td>From Account</td><td><%out.print(from); %></td><td>from</td>
    </tr>
    <tr>
      <td>To Account</td><td><%out.print(amount); %></td><td>to</td>
    </tr>
    <tr>
      <td>Amount</td><td><%out.print(time); %></td><td>amount</td>
    </tr>
   
  </table>
</body>
</html>