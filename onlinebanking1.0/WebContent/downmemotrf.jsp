<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language = "java" contentType = "text/html" %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*"%>
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
                .btn{
        margin-left: 12cm;
        margin-top: 1cm;
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
        <div class="user-login">
          <a href="login.jsp">

          <div class="name">
            <span class="first-name">Sergey</span> <span class="last-name">logout
            safty</span>
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
    <% 										
    	String from =(String) request.getAttribute("ffromnum");
    	String to =(String) request.getAttribute("ftonum");
    	String amount = (String)request.getAttribute("famount"); 
    	String referenceno = (String)request.getAttribute("referenceno"); 


										
    	request.setAttribute("fffrom",from);
    	request.setAttribute("ftonum",to);
    	request.setAttribute("famount",amount);  
    	request.setAttribute("referemceno",referenceno);  

%>
 <form action="DownloadMemo.jsp?fffrom=${fffrom }&ftonum=${ftonum}&famount=${famount}&referenceno=${referenceno}" method="POST"> 
    <table class="bordered" style="width: 10cm;margin-left: 5cm;margin-top: 5cm;">  
    <thead>  

        <tr>  
    <th>items</th>  
    <th>contents</th>  

      
    </tr>  
          </thead> 
        <tr>  
    <td>memo no  this is transfer memo</td>  
    <td>feifei</td>  

      
    </tr>  

    <tr>  
    <td>FROM</td>  
    <td><%=from %></td>  

    </tr>  
 
    <tr>  
    <td>TO</td>  
    <td><%=to %></td>  
      
 
    </tr>  
  
    <tr>  
     <td>AMOUNT</td>  
    <td><%=amount %></td>

    </tr>  



      
    </table> 
  </div>
  	 
  	 	<input class="btn" type="submit" value="Download memo" ></input>
  	 </form> 
  </div>
</body>
</html>