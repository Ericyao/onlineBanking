<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="jdbcConnection.*" %>
<%@page import = "java.util.*" %>
<%@page import = "controller.historySevlet" %>
<%
	int dipage=1;
	String pages = request.getParameter("dipage");
	if(pages == null){
		pages = "1";
	}
	try{
		dipage = Integer.parseInt(pages);
	}catch(Exception e){
		dipage = 1;
	}
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
    <meta name="description" content="Modern UI CSS">
    <meta name="author" content="Sergey Pimenov">
    <meta name="keywords" content="windows 8, modern style, modern ui, style, modern, css, framework">
    <link href="css/modern.css" rel="stylesheet" type="text/css">
    <link href="css/theme-dark.css" rel="stylesheet" type="text/css">
    <link href="css/modern-responsive.css" rel="stylesheet" type="text/css">
    <link href="css/metro-bootstrap.css" rel="stylesheet" type="text/css">
    <script src="js/assets/jquery-1.8.2.min.js" type="text/javascript">
</script><!--      <script src="js/assets/google-analytics.js"></script> -->

<script src="js/assets/jquery.mousewheel.min.js" type="text/javascript">
</script>
<script src="js/assets/github.info.js" type="text/javascript">
</script>
<script src="js/modern/tile-slider.js" type="text/javascript">
</script>
<script type="text/javascript" src="input_validate.js">
</script>
<script type="text/javascript" src="docs/bootstrap-tab.js">
</script>
<title>
    History
</title>
<style type="text/css">
body
{
    font: 12px 'Lucida Sans Unicode', 'Trebuchet MS', Arial, Helvetica;    
    margin: 0;
    background-color: #76b5ba;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebeef2), to(#2b1128));
    background-image: -webkit-linear-gradient(top, #ebeef2, #2b1128);
    background-image: -moz-linear-gradient(top, #ebeef2, #2b1128);
    background-image: -ms-linear-gradient(top, #ebeef2, #2b1128);
    background-image: -o-linear-gradient(top, #ebeef2, #2b1128);
    background-image: linear-gradient(top, #ebeef2, #2b1128);    
}
#history1 {
    margin-left: 4.3cm;
    margin-top: 5cm;
    margin-bottom: 0.2cm;
}
#history2 {
    margin-left: 3cm;

}


button[type=submit] {
    background-color: #afb4be;
    color: #fff;
    margin-left: 13cm;
    margin-top: 4cm;
}
</style>
<script type="text/javascript">
function Resize(){
    var tiles_area = 0;
    $(".tile-group").each(function(){
        tiles_area += $(this).outerWidth() + 80;

    });

    $(".tiles").css("width", 120 + tiles_area + 20);

    $(".page").css({
        height: $(document).height() - 20,
        width: $(document).width()
    });
}

function AddMouseWheel(){
    $("body").mousewheel(function(event, delta){
        var scroll_value = delta * 50;
        if (!jQuery.browser.chrome) {
            document.documentElement.scrollLeft -= scroll_value;
        } else {
            this.scrollLeft -= scroll_value;
        }
        return false;
    });
}

$(function(){

    Resize();
    AddMouseWheel();

})


</script>
</head>
<body class="modern-ui" onresize="Resize()">
    <div class="page secondary fixed-header">
        <div class="page-header">
            <div class="page-header-content">
                <div class="user-login">
                    <a href="#"></a>
                    <div class="name">
                      <% 
        String Vfusername =(String)request.getSession().getAttribute("Username");
 %>
                        <span class="first-name"><%=Vfusername %></span> <span class="last-name">logout safty</span>
                    </div>
                    <div class="avatar">
                        <img src="images/myface.jpg" alt="">
                    </div>
                </div>
                <h1>
                    Start
                </h1>
                <div style="position: absolute; left: 40px; bottom: -25px;">
                    <a href="metro.jsp"><img src="images/back.png" width="70" height="70" alt=""></a>
                </div>
            </div>
        </div>
        <div style="clear:both"></div>
        <div>
            <div style="float:left">
                <form class="controls docs-input-sizes" action = "historySevlet" method="POST">
                    <div id="history1" >
                        <select style="width:430px;" name = "selectAcct">
                          <% 
   							String username = (String)session.getAttribute("Username");
    						out.println(username);
   							AcctDAOimpl udifrom = new AcctDAOimpl();
    						AcctBean acctfrom = null;
    						String acct = null;
    						try {
      								ArrayList<String> acctList = udifrom.getAccounts(username);
          							if(acctList.isEmpty()){
            							out.println("No data!");
          							}
          							for(int i=0;i<acctList.size();i++){%>
       									<option> <%= acctList.get(i) %></option>
      								<%}
         							 // request.setAttribute("SigninFailMsg", "Please check your inputs!");
    						}catch (Exception e) {
     							 // TODO Auto-generated catch block
      								e.printStackTrace();
    						}
						 %>
                        </select>
                    </div>
                    <div id="history2">
                        <p class="input">
                         <input type="date" name = "dateBegin"  class="span4" required="required" placeholder="Type something…" style="margin-left: 50px; width:200px;" autofocus="autofocus" >
                         <input type="date" name = "dateEnd" class="span4" required="required" placeholder="Type something…"  style=" width:207px;" >
                     </p>
                 </div>
                 <button type="submit" class="btn">Submit</button>
             </form>
         </div>

         <div style="float:left;  margin-top:5cm; margin-left:1cm;">
       	<table class="table-striped">
        	<tr style="color: #73c474;"><td colspan=8 align=center>History</td></tr>
        	<tr>
            	<td>ReferenceNO</td>
            	<td>Date</td>
            	<td>From Account</td>
            	<td>To Account</td>
            	<td>Transfer Type</td>
            	<td>Amount</td>
      		</tr>
        <%
			//Change!!!!!!
			//String date1 = "2012-12-07";
			//String date2 = "2012-12-10";
			//String acctnum = "111";
			/*String submitFlag= (String)request.getAttribute("submitFlag");*/
			String date1= (String)request.getAttribute("dateBegin");
			String date2= (String)request.getAttribute("dateEnd");
			String acctnum = (String)request.getAttribute("selectAcct");
			//if(submitFlag.compareTo("true")==0){
			if(true){
				String sql = "SELECT * FROM history WHERE (Date >= ? AND Date <= ?) AND (fromacct = ? OR toacct = ?)";
				PreparedStatement pstmt = null;
				DBconnection dbc = null;
				HistoryBean history = new HistoryBean();
				try{
					//connect to database
					dbc = new DBconnection();
					pstmt = dbc.getConnection().prepareStatement(sql);
					pstmt.setString(1,date1);
					pstmt.setString(2,date2);
					pstmt.setString(3,acctnum);
					pstmt.setString(4,acctnum);
					//Query the database
					ResultSet rs = pstmt.executeQuery();
	
					//for initial
					int countRecord = 0; //record how many items 
					int countPageRecord = 0;//record the number of items one a
					int countPage = 0;//the total pages
					countPageRecord = 5;//Every page 5 records
					//the number of items gotten
					rs.last();
					countRecord = rs.getRow();
					//total pages
					if(countRecord%countPageRecord == 0)
					countPage=countRecord/countPageRecord;
					else
						countPage=countRecord/countPageRecord+1;
					//move the record pointer to the current page before the first record
					if((dipage-1)*countPageRecord==0)
						rs.beforeFirst();
					else
						rs.absolute((dipage-1)*countPageRecord);
		
					//out.print("<Table Border style='font-size: 10pt'>");
					int i=0;
					while(rs.next()){
						out.print("<TR>");
						out.print("<TD >"+rs.getString(1)+"</TD>");//Reference
						out.print("<TD >"+rs.getString(6)+"</TD>");//Date
						out.print("<TD >"+rs.getString(2)+"</TD>");//fromAcct
						out.print("<TD >"+rs.getString(3)+"</TD>");//toAcct
						out.print("<TD >"+rs.getString(4)+"</TD>");//type
						out.print("<TD >"+rs.getString(5)+"</TD>");//amount
						out.print("</TR>") ;
						i++;
						if(i>=countPageRecord) break; //the current page has shown , exit
					}
					out.print("<TR><td colspan=20 align=center>");
					out.print("Total "+countRecord+" records total "+countPage+" pages Current  "+dipage+" page Every page  "+countPageRecord+" records.");
					if(dipage == 1)//the first page
  						;
					else{
			 			out.print("<a href=history.jsp?dipage=1>Index</a>");
			 			out.print("<a href=history.jsp?dipage="+(dipage-1)+">Last Page</a>");
					} 
					if(dipage==countPage)//the last page
						;
					else{
						out.print("<a href=history.jsp?dipage="+(dipage+1)+">Next page</a>");
						out.print("<a href=history.jsp?dipage="+countPage+">Last Page</a>");
					}
					out.print("</td></tr>"); 
					out.print("</Table>");
					dbc.close();
				}catch(SQLException el){
					out.print("SQL Wrong!");
				}
			}else{
				System.out.println("The date is wrong!");
			}
		%>
</table>
</div>
</div>



</div>
</body>
</html>