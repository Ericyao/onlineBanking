
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language = "java" contentType = "text/html" %>
<%@page import = "java.sql.*" %>
<%@page import = "jdbcConnection.*" %>
<%@page import = "java.util.*" %>
<head>
  <meta name="generator" content=
  "HTML Tidy for Linux/x86 (vers 11 February 2007), see www.w3.org" />
  <meta charset="utf-8" />
  <meta name="viewport" content=
  "target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1" />
  <meta name="Description" content="Modern UI CSS" />
  <meta name="author" content="Sergey Pimenov" />
  <meta name="Keywords" content=
  "windows 8, modern style, modern ui, style, modern, css, framework" />
  <link href="css/modern.css" rel="stylesheet" type="text/css" />
  <link href="css/theme-dark.css" rel="stylesheet" type="text/css" />
  <link href="css/modern-responsive.css" rel="stylesheet" type="text/css" />
  <link href="css/metro-bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="css/dialog.css" rel="stylesheet" type="text/css" />
  <script src="js/assets/jquery-1.8.2.min.js" type="text/javascript">
</script>

  <script src="js/assets/jquery.mousewheel.min.js" type="text/javascript">
</script>
  <script src="js/assets/github.info.js" type="text/javascript">
</script>
  <script src="js/modern/tile-slider.js" type="text/javascript">
</script>
  <script type="text/javascript" src="docs/bootstrap-tab.js">
</script>
  <script src="js/dialog.js" type="text/javascript">
</script>


  <title>Transfer</title>
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

        #transfer1 {

        margin-left: 7cm;

        margin-top: 6cm;

        float: left;





        }

        #transfer2 {

        margin-left: -14.1cm;

        margin-top: 7.3cm;

        float: left;





        }

        #transfer3 {

        margin-left: 7cm;

        margin-top: 0.7cm;

        float: left;





        }

        #botton {

        margin-left: 7cm;

        margin-top: 8cm;

        float: left;





        }

        p.input{

        font-size: 26px;

        color: #fff;

        font-weight:bold; 

        line-height:35px;

        }



        .btn{

        margin-left: -1cm;

        margin-top: 2.5cm;



        }

        input[type=submit] {

        background-color: #afb4be;

        color: #fff;

        }

  #apDiv1 {
  position:absolute;
  width:1px;
  height:1px;
  z-index:1;
  visibility: hidden;
  left: 1px;
  top: 1px;
  overflow: hidden;
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

    <div style="float:left">
      <form class="form-horizontal" action = "verifyfy" method = "POST">
        <div id="transfer1">
          <p class="input" >From :</p>
          <p class="input" >TO :</p>
          <p class="input" >COUNT :</p>
      </div>

      <div  style="float:right; margin-left: -7.5cm;margin-top: 6cm;">



           <select name="Stransferfromnum" style=
          "height:35px; width:356px;">
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
          // request.setAttribute("SigninFailMsg", "Please check your inputs!");
    }catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
        //return;
    }
    
    
    %>
          </select>
<span class="help-block">  </span>
 <input type="number"  name = "Stransfertonum" class="span4" required="required"
          placeholder="Type something ...;" autofocus="autofocus"  min="0" max="999999999" />
          <span class="help-block">  </span>
 <input type="number"  name = "StransferAmount" class="span4" required="required"
          placeholder="Type something ...;" autofocus="autofocus"  min="0" max="999999999" />
        </div>

        

        <div id="botton">
          <input class="btn" type="submit"  value="Submit" />
        </div>


      </form>
    </div>

    <div style="float:right; margin-top: -9.5cm;margin-right: 5cm;">

    </div>
  </div>
</body>
</html>