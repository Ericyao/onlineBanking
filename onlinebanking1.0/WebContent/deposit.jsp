<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language = "java" contentType = "text/html" %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*" %>
<%@page import = "java.util.ArrayList" %>
<head>
  <meta name="generator" content=
  "HTML Tidy for Linux/x86 (vers 11 February 2007), see www.w3.org" />
  <meta charset="utf-8" />
  <meta name="viewport" content=
  "target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1" />
  <meta name="description" content="Modern UI CSS" />
  <meta name="author" content="Sergey Pimenov" />
  <meta name="keywords" content=
  "windows 8, modern style, modern ui, style, modern, css, framework" />
  <link href="css/modern.css" rel="stylesheet" type="text/css" />
  <link href="css/theme-dark.css" rel="stylesheet" type="text/css" />
  <link href="css/modern-responsive.css" rel="stylesheet" type="text/css" />
  <link href="css/metro-bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/dialog.css" rel="stylesheet" type="text/css" />
    
  <script src="js/assets/jquery-1.8.2.min.js" type="text/javascript">
</script><!--      <script src="js/assets/google-analytics.js"></script> -->

  <script src="js/assets/jquery.mousewheel.min.js" type="text/javascript">
</script>
  <script src="js/assets/github.info.js" type="text/javascript">
</script>
  <script src="js/modern/tile-slider.js" type="text/javascript">
</script>
      <script src="js/dialog.js" type="text/javascript">
</script>
  <script src="js/prettify.js" type="text/javascript">
</script>

  <title>Comfig</title>
  <style type="text/css">
/*<![CDATA[*/
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
 
      table {  
    *border-collapse: collapse; /* IE7 and lower */  
    border-spacing: 0;  
    width: 100%;  
    }  
      
    .bordered {  
    border: solid #ccc 1px;  
    -moz-border-radius: 6px;  
    -webkit-border-radius: 6px;  
    border-radius: 6px;  
    -webkit-box-shadow: 0 1px 1px #ccc;  
    -moz-box-shadow: 0 1px 1px #ccc;  
    box-shadow: 0 1px 1px #ccc;  
    }  
      
    .bordered tr:hover {  
    background: #fbf8e9;  
    -o-transition: all 0.1s ease-in-out;  
    -webkit-transition: all 0.1s ease-in-out;  
    -moz-transition: all 0.1s ease-in-out;  
    -ms-transition: all 0.1s ease-in-out;  
    transition: all 0.1s ease-in-out;  
    }  
      
    .bordered td, .bordered th {  
    border-left: 1px solid #ccc;  
    border-top: 1px solid #ccc;  
    padding: 10px;  
    text-align: left;  
    }  
      
    .bordered th {  
    background-color: #dce9f9;  
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));  
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);  
    background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);  
    background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);  
    background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);  
    background-image: linear-gradient(top, #ebf3fc, #dce9f9);  
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;  
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;  
    border-top: none;  
    text-shadow: 0 1px 0 rgba(255,255,255,.5);  
    }  
      
    .bordered td:first-child, .bordered th:first-child {  
    border-left: none;  
    }  
      
    .bordered th:first-child {  
    -moz-border-radius: 6px 0 0 0;  
    -webkit-border-radius: 6px 0 0 0;  
    border-radius: 6px 0 0 0;  
    }  
      
    .bordered th:last-child {  
    -moz-border-radius: 0 6px 0 0;  
    -webkit-border-radius: 0 6px 0 0;  
    border-radius: 0 6px 0 0;  
    }  
      
    .bordered th:only-child{  
    -moz-border-radius: 6px 6px 0 0;  
    -webkit-border-radius: 6px 6px 0 0;  
    border-radius: 6px 6px 0 0;  
    }  
      
    .bordered tr:last-child td:first-child {  
    -moz-border-radius: 0 0 0 6px;  
    -webkit-border-radius: 0 0 0 6px;  
    border-radius: 0 0 0 6px;  
    }  
      
    .bordered tr:last-child td:last-child {  
    -moz-border-radius: 0 0 6px 0;  
    -webkit-border-radius: 0 0 6px 0;  
    border-radius: 0 0 6px 0;  
    }  
      
    /*----------------------*/  
      
    .zebra td, .zebra th {  
    padding: 10px;  
    border-bottom: 1px solid #f2f2f2;  
    }  
      
    .zebra tbody tr:nth-child(even) {  
    background: #f5f5f5;  
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;  
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;  
    }  
      
    .zebra th {  
    text-align: left;  
    text-shadow: 0 1px 0 rgba(255,255,255,.5);  
    border-bottom: 1px solid #ccc;  
    background-color: #eee;  
    background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));  
    background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);  
    background-image: -moz-linear-gradient(top, #f5f5f5, #eee);  
    background-image: -ms-linear-gradient(top, #f5f5f5, #eee);  
    background-image: -o-linear-gradient(top, #f5f5f5, #eee);  
    background-image: linear-gradient(top, #f5f5f5, #eee);  
    }  
      
    .zebra th:first-child {  
    -moz-border-radius: 6px 0 0 0;  
    -webkit-border-radius: 6px 0 0 0;  
    border-radius: 6px 0 0 0;  
    }  
      
    .zebra th:last-child {  
    -moz-border-radius: 0 6px 0 0;  
    -webkit-border-radius: 0 6px 0 0;  
    border-radius: 0 6px 0 0;  
    }  
      
    .zebra th:only-child{  
    -moz-border-radius: 6px 6px 0 0;  
    -webkit-border-radius: 6px 6px 0 0;  
    border-radius: 6px 6px 0 0;  
    }  
      
    .zebra tfoot td {  
    border-bottom: 0;  
    border-top: 1px solid #fff;  
    background-color: #f1f1f1;  
    }  
      
    .zebra tfoot td:first-child {  
    -moz-border-radius: 0 0 0 6px;  
    -webkit-border-radius: 0 0 0 6px;  
    border-radius: 0 0 0 6px;  
    }  
      
    .zebra tfoot td:last-child {  
    -moz-border-radius: 0 0 6px 0;  
    -webkit-border-radius: 0 0 6px 0;  
    border-radius: 0 0 6px 0;  
    }  
      
    .zebra tfoot td:only-child{  
    -moz-border-radius: 0 0 6px 6px;  
    -webkit-border-radius: 0 0 6px 6px  
    border-radius: 0 0 6px 6px  


    }  
  .fform {
            margin-left: 5cm;
            margin-top: 5cm ;
          }
    </style>  
  <script type="text/javascript">
//<![CDATA[
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


  //]]>
  </script>
  <style type="text/css">
/*<![CDATA[*/
  div.c1 {position: absolute; left: 40px; bottom: -25px;}
  /*]]>*/
  </style>
</head>

<body class="modern-ui" onresize="Resize()">

  <div class="page secondary fixed-header">
    <div class="page-header">
      <div class="page-header-content">
        <div class="user-login" onclick="window.open('login.jsp','_self')">
          <a href="login.jsp">
 <% 
        String Vfusername =(String)request.getSession().getAttribute("Username");
 %>
          <div class="name">
            <span class="first-name"><%=Vfusername%></span> <span class="last-name">logout
            safety</span>
          </div>

          <div class="avatar"><img src="images/myface.jpg" alt="" /></div>
        </a>
        </div>

        <h1>Start</h1>

        <div style="position: absolute; left: 40px; bottom: -25px;">
          <a href="metro.jsp"><img src="images/back.png" width="70" height="70" alt=
          "" /></a>
        </div>
      </div>
    </div>

<div >
  <form class="fform" action = "CheckServlet" method = "POST">
    <a style="font-size:19pt;color:white;">Account:<a> 
    <select  style="width:356px;" name = "checknum" >
     <% 
	 String STusername = (String)session.getAttribute("Username");
		out.println(STusername);
		  AcctDAOimpl udito = new AcctDAOimpl();
          AcctBean acctto = null;
		String tacctnum = null;
		try {
			ArrayList<String> acctList = udito.getAccounts(STusername);
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
		    //return;
		}
		
		
		%>
                  </select>
                  <input class="btn" type="submit" value="Submit" />
  </form>
    <table class="bordered" style="width: 16cm;margin-top:1cm;table-layout:auto;";">  
    <thead>  
      <%
      	String currency = (String)request.getAttribute("currency");
      	Date begin = (Date)request.getAttribute("begin");
      	Date end = (Date)request.getAttribute("end");
     	String amount =(String)request.getAttribute("amount");
      	String checkacctnum = (String)request.getAttribute("checknum");
      %>
    <tr>  
    <th>#</th>  
    <th>currency</th>  
    <th>FROM</th>  
        <th>TO</th>  
            <th>COUNT</th>  
             <th>opertion</th>
    </tr>  
    </thead>  
    <tr>  
    <td>1</td>  
    <td><%=currency %></td>  
        <td><%=begin %></td>  
            <td><%=end %></td>  
                <td><%=amount %></td>  
                  <td> 
                  <input class="btn" type="button"
                        value="interrupt" onclick=
          "new Dialog({type:'id',value:'apDiv1'}).show();" />        </td>  

      

    </tr>  


      
    </table> 
  </div>
  
  <div id="apDiv1" style="visibility: hidden;float:right"  >
  <form  action = "TDinterrupt",method = "POST">
            <p>Are you sure interrupt the deposit?</p>
            <input name="Sure" type="submit" value="Sure"  />
            </form>
          </div>
         
  </div>
</body>
</html>