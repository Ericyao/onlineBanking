<!DOCTYPE html>
<%@page import = "javax.servlet.ServletException"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="javax.servlet.http.HttpServletResponse"%>
<%@page import ="javax.servlet.http.HttpSession" %>
<%@page import = "java.sql.*" %>

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
        <script src="js/assets/jquery-1.8.2.min.js" type="text/javascript">
</script><!--      <script src="js/assets/google-analytics.js"></script> -->

        <script src="js/assets/jquery.mousewheel.min.js" type="text/javascript">
</script>
        <script src="js/assets/github.info.js" type="text/javascript">
</script>
        <script src="js/modern/tile-slider.js" type="text/javascript">
</script>
        <title>
            Metro
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
    	<%String Metrousername =(String)request.getSession().getAttribute("Username"); 
    		// out.println(Metrousername);
    		
    		//request.getSession().setAttribute("Metrousername", Metrousername);
    	%>
        <div class="page secondary fixed-header">
            <div class="page-header">
                <div class="page-header-content">
                    <div class="user-login" onclick="window.open('login.jsp','_self')">
                        <a href="login.jsp"></a>
                        <div class="name">
                            <span class="first-name"><%=Metrousername %></span> <span class="last-name">logout safety</span>
                        </div>
                        <div class="avatar" >
                            <img alt="" src="images/myface.jpg">
                        </div>
                    </div>
                    <h1>
                        Start
                    </h1>
                </div>
            </div>
            <div class="page-region">
                <div class="page-region-content tiles">
                    <div class="tile-group">
                        <div class="tile image outline-color-green">
                            <div class="tile-content" onclick="window.open('info.jsp','_self')">
                                <img alt="" src="images/myface.jpg" >
                            </div>
                        </div>
                        <div class="tile icon" onclick="window.open('maintain.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/userinfo.png">
                            </div>
                            <div class="brand">
                                <div class="badge"></div>
                                <div class="name">
                                    MainTain
                                </div>
                            </div>
                        </div>
                        <div class="tile bg-color-orangeDark icon" onclick="window.open('transfer.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/transfer.png" >
                            </div>
                            <div class="brand">
                                <span class="name">Transfer</span>
                            </div>
                        </div>
                        <div class="tile double image">
                            <div class="tile-content">
                                <img alt="" src="images/5.jpg" >
                            </div>
                            <div class="brand">
                                <span class="name">Calendar</span>

                            </div>
                        </div>
                        <div class="tile bg-color-pink icon" onclick="window.open('history.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/history.png">
                            </div>
                            <div class="brand">
                                <span class="name">History</span>
                            </div>
                        </div>
                        <div class="tile bg-color-red icon" onclick="window.open('settime.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/settime.png" >
                            </div>
                            <div class="brand">
                                <span class="name">Set Time</span>
                            </div>
                        </div>
                        <div class="tile bg-color-pink icon" onclick="window.open('rate.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/rate.png">
                            </div>
                            <div class="brand">
                                <span class="name">Rate</span>
                            </div>
                        </div>
                        <div class="tile icon" onclick="window.open('deposit.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/interrupt.png">
                            </div>
                            <div class="brand">
                                <span class="name">Check Deposit</span>
                            </div>
                        </div>
                        <div class="tile bg-color-darken icon" onclick="window.open('balance.jsp','_self')">
                            <div class="tile-content">
                                <img alt="" src="images/balance.png" >
                            </div>
                            <div class="brand">
                                <span class="name">Balance</span>
                            </div>
                        </div>

                                                <div class="tile bg-color-blue icon" >
                            <div class="tile-content">
                                <img alt="" src="images/Documents.png">
                            </div>
                            <div class="brand">
                                <span class="name">Infomation</span>
                            </div>
                        </div>
                        <div class="tile icon" >
                            <div class="tile-content">
                                <img alt="" src="images/stock.png">
                            </div>
                            <div class="brand">
                                <span class="name">Stock</span>
                            </div>
                        </div>
                        <div class="tile double image-slider" data-role="tile-slider" data-param-period="5000" data-param-direction="left">
                            <div class="tile-content">
                                <img alt="" src="images/1.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/2.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/3.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/4.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/5.jpg" >
                            </div>
                        </div>
                    </div>
                    <div class="tile-group" style="width: 322px;">
                        <div class="tile double bg-color-blueDark" data-role="tile-slider" data-param-period="3000" onclick="window.open('http://weibo.com/210002567')">
                            <div class="tile-content">
                                <h2>Liam
                                </h2>
                                <h5>United International College</h5>
                                <p>
                                    http://weibo.com/210002567
                                </p>
                            </div>
                            <div class="tile-content">
                                <h2> Liam
                                
                                </h2>
                                <h5>UIC graduate in court for the defense Rosa Silva, a 1998 alumna with a master's in sociology, advocates for clients as a Cook County public defender...</h5>
                                <p>
                                    If you don't build your dream, they will hire you to build theirs.
                                </p>
                            </div><!--                     <div class="brand">
                        <div class="badge">12</div>
                        <img alt="" class="icon" src="images/Mail128.png"/>
                    </div> -->
                        </div>
                        <div class="tile double fg-color-darken" onclick="window.open('http://weibo.com/u/1794587384')">
                            <div class="tile-content">
                                <img alt="" src="images/yy.jpg" width="90" height="90" class="place-left">
                                <h3 style="margin-bottom: 5px;">
                                      ____MaN-
  
                                </h3>
                                <p>Alone in the world, a mess .. </p><!-- <h5>http://weibo.com/u/1922594933</h5> -->
                            </div>
                            <div class="brand">
                                <span class="name">http://weibo.com/u/1922594933</span>
                            </div>
                        </div>
                        <div class="tile double image-set">
                            <div class="tile-content">
                                <img alt="" src="images/1.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/2.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/3.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/4.jpg" >
                            </div>
                            <div class="tile-content">
                                <img alt="" src="images/5.jpg" >
                            </div>
                            <div class="brand">
                                <span class="name">Photos</span>
                            </div>
                        </div>
                    </div>
                    <div class="tile-group" style="width: 322px;">
                        <div class="tile double bg-color-blueDark" data-role="tile-slider" data-param-period="3000" onclick="window.open('http://weibo.com/u/1859126980')">
                            <div class="tile-content">
                                <img alt="" src="images/yyx.jpg" width="90" height="90" class="place-left">
                                <h3 style="margin-bottom: 5px;">
                                    lyxx_
                                </h3>
                                <p>He also did not fill out a personal profile</p><!-- <h5>http://weibo.com/u/1922594933</h5> -->
                            </div>
                            <div class="brand">
                                <span class="name">http://weibo.com/u/1859126980</span> <!--                     <div class="brand">
                        <div class="badge">12</div>
                        <img alt="" class="icon" src="images/Mail128.png"/>
                    </div> -->
                            </div>
                        </div>
                                                <div class="tile double bg-color-blueDark" onclick="window.open('http://weibo.com/u/1922594933')">
                            <div class="tile-content">
                                <img alt="" src="images/gyf.jpg" width="90" height="90" class="place-left">
                                <h3 style="margin-bottom: 5px;">
I dynamic</h3>
                                <p>she also did not fill out a personal profile</p><!-- <h5>http://weibo.com/u/1922594933</h5> -->
                            </div>
                            <div class="brand">
                                <span class="name">http://weibo.com/u/1922594933</span>
                            </div>
                        </div>

<!--                         <div class="tile icon" >
                            <div class="tile-content">
                                <img alt="" src="images/word2013icon.png">
                            </div>
                            <div class="brand">
                                <span class="name">Word 2013</span>
                            </div>
                        </div>
                        <div class="tile icon" >
                            <div class="tile-content">
                                <img alt="" src="images/onenote2013icon.png">
                            </div>
                            <div class="brand">
                                <span class="name">OneNote 2013</span>
                            </div>
                        </div> -->
                    </div>
                    <div>
                        <div class="tile-group">
                            <div class="tile quadro double-vertical image-set">
                                <div class="tile-content">
                                    <img alt="" src="images/1.jpg" >
                                </div>
                                <div class="tile-content">
                                    <img alt="" src="images/2.jpg" >
                                </div>
                                <div class="tile-content">
                                    <img alt="" src="images/3.jpg" >
                                </div>
                                <div class="tile-content">
                                    <img alt="" src="images/4.jpg" >
                                </div>
                                <div class="tile-content">
                                    <img alt="" src="images/5.jpg" >
                                </div>
                                <div class="brand">
                                    <span class="name">Photos</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>