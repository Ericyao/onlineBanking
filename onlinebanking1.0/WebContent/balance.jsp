<%@page language = "java" contentType = "text/html" %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*" %>
<%@page import = "controller.*" %>
<%@page import = "java.util.*" %>
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
    Maintain
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
    margin-left: 10cm;
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
 <% String balance = (String)request.getAttribute("balance");%>
    <div class="page secondary fixed-header">
        <div class="page-header">
            <div class="page-header-content">
                <div class="user-login"  onclick="window.open('login.jsp','_self')">
                    <a href="login.jsp"></a>
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
            		 <form class="controls docs-input-sizes" action="ShowBalance" method = "POST">
                    <div id="history1" >
                        <select  name="selectAcct" style="width:330px;">
                        <% 
   							String username = (String)session.getAttribute("Username");
     						out.println("zhegeshi");
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
							}catch (Exception e) {
 								  e.printStackTrace();
    						}
    
    
    					%>
                        </select>
                    </div>

                 <button type="submit" class="btn">Submit</button>
             </form>
         </div>

         <div style="float:left;  margin-top:5cm; margin-left:1cm;">
        	<p><%out.print(balance); %></p>
</div>
</div>



</div>
</body>
</html>