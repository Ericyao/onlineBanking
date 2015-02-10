<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language = "java" contentType = "text/html" %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*"%>
<%@page import = "controller.*"%>
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

<title>Maintain</title>
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
p{
  font-size: 26px;
  color: #fff;
  font-weight:bold; 
  line-height:35px;
}
.btn{
  margin-left: 1cm;
  margin-top: 12.5cm;

}
input[type=submit] {
  background-color: #afb4be;
  color: #fff;
}
/*]]>*/
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
          <a href="#"></a>
          <% 
          String Vfusername =(String)request.getSession().getAttribute("Username");
          %>
          <div class="name">
            <span class="first-name"><%=Vfusername %></span> <span class="last-name">logout
            safety</span>
          </div>

          <div class="avatar"><img src="images/myface.jpg" alt="" /></div>
        </div>

        <h1>Start</h1>

        <div style="position: absolute; left: 40px; bottom: -25px;">
          <a href="metro.jsp"><img src="images/back.png" width="70" height="70" alt=
            "" /></a>
          </div>
        </div>
      </div>

      <form class="form-horizontal" id ="SFServlet" action = "SFServlet" method="POST">
        <div id="maintain1">
          <%  
          String accountfrom =(String) request.getAttribute("1fromnum");
		  String accountto =(String) request.getAttribute("2tonum");
          String amount =(String) request.getAttribute("3amount");
          
    	 
    	  String user =(String)request.getAttribute("4name");
    	  System.out.println(accountfrom+accountto+amount+user);
      

          %>
          <p class="input" >FROM:</p>

          <p class="input" >TO:</p>
          
           <p class="input" >NAME:</p>

          <p class="input">COUNT:</p>
        </div>

        <div id="maintain2">
          <input type="text"  class="span4"  style="background-color: transparent;
          border: 0px;font-size: 20px;font-weight: bold;" name = "fromnum" value ="<%=accountfrom %>"  >
          <span class="help-block">  </span>

          <input type = "text" class="span4" style="  background-color: transparent;
          border: 0px;font-size: 20px;font-weight: bold;" name = "tonum" value ="<%=accountto %>" >
          <span class="help-block">  </span>
          
           <input type = "text" class="span4" style="  background-color: transparent;
          border: 0px;font-size: 20px;font-weight: bold;" name = "user" value ="<%=user %>" >
          <span class="help-block">  </span>


          <input type="text" class="span4"  style="  background-color: transparent;
          border: 0px;font-size: 20px;font-weight: bold;" name = "Amount" value="<%=amount %>">
          <span class="help-block">  </span>

        </div>
        <input class="btn" type="submit" value="Sure">

      </form>
    </div>
  </body>
  </html>