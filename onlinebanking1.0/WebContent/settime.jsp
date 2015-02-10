<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language = "java" contentType = "text/html" %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*" %>
<%@page import = "java.util.*" %>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
    <meta name="description" content="Modern UI CSS">
    <meta name="author" content="Sergey Pimenov">
    <meta name="keywords" content="windows 8, modern style, modern ui, style, modern, css, framework">

    <link href="css/modern.css" rel="stylesheet">
    <link href="css/theme-dark.css" rel="stylesheet">
    <link href="css/modern-responsive.css" rel="stylesheet">
    <link href="css/metro-bootstrap.css" rel="stylesheet">
  <link href="css/dialog.css" rel="stylesheet" type="text/css" />
    <script src="js/assets/jquery-1.8.2.min.js"></script>
    <!--      <script src="js/assets/google-analytics.js"></script> -->
    <script src="js/assets/jquery.mousewheel.min.js"></script>
    <script src="js/assets/github.info.js"></script>
    <script src="js/modern/tile-slider.js"></script>

      <script src="js/dialog.js" type="text/javascript">
</script>
  <script src="js/prettify.js" type="text/javascript">
</script>
 <script type="text/javascript">
  function setvalue(index)
  {
   var RATE = document.getElementById('select').options[index].value;
   document.getElementById('text').value = RATE*0.01;
  }
 </script>

    <title>Maintain</title>

    <style>
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
    #maintain1 {
        margin-left: 7cm;
        margin-top: 5cm;
        float: left;


    }
    #maintain2 {
        margin-left: 1cm;
        margin-top: 5cm;
        float: left;
    }
    p.input{
        font-size: 26px;
        color: #fff;
        font-weight:bold; 
        line-height:35px;
    }
    .btn{
        margin-left: -2cm;
        margin-top: 12.5cm;
        


    }
    input[type=submit] {
      background-color: #afb4be;
      color: #fff;
  }
  </style>

  <script>
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
        <div class="page-header ">
            <div class="page-header-content">
                <div class="user-login" onclick="window.open('login.jsp','_self')">
                    <a href="#">
                        <div class="name">
                         <% 
        String Vfusername =(String)request.getSession().getAttribute("Username");
 %>
                            <span class="first-name"><%=Vfusername %></span>
                            <span class="last-name">logout safety</span>
                        </div>
                        
                        <div class="avatar">
                            <img alt="" src="images/myface.jpg"/>
                        </div>
                        
                    </a>
                </div>

                <h1>Start</h1>
                <div style="position: absolute;  left: 40px; bottom: -25px;" >
                    <a href="metro.jsp">
                        <img alt="" src="images/back.png" width= "70"   height= "70" />
                    </a>
                </div>
            </div>
        </div>
<div style="float:left;">
        <form class="form-horizontal" action = "Verify.jsp"  method="POST">
            <div Id=maintain1>
                 <p class=input> FROM:  
                     <p class=input> TIME:  
                        <p class=input>RATE: 
                         <p class=input> COUNT: 

                         </div>
                         <div Id=maintain2>

          <select style=
        "height:35px; width:356px; " name = "TDfromacct">
         
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
        
        
  <span class="help-block">  </span>

                          <select id="select" onchange="setvalue(selectedIndex)" style=
        "height:35px; width:356px; " name = "TDrate">
         <option>请选择</option>
         <option value='3'>3</option>
         <option value='6'>6</option> 
         <option value='9'>9</option>
         <option value='12'>12</option>
   </select>


                            <span class="help-block">  </span>

                            <input type="text" class="span4" id="text" required="required" placeholder="The rate for deposit" disabled="disabled" >
                            <span class="help-block">  </span>

                            <input type="number" class="span4" placeholder="Type something…" required="required" min="0" name ="TDamount">
                            <span class="help-block" >  </span>


                        </div>



                        <input class="btn" type="submit" value="Submit"  />

                    </form>


                </div>







            </body>
            </html>