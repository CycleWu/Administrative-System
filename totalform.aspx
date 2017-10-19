<%@ page language="C#" autoeventwireup="true" inherits="totalform, App_Web_5ymge2ba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="dist/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.css"/>
    <link rel="stylesheet" type="text/css" href="open-iconic-master/font/css/open-iconic-bootstrap.min.css"/>
    <script type="text/javascript" src="dist/js/jquery.js"></script> 
    <script type="text/javascript" src="https://unpkg.com/popper.js"></script>
    <script type="text/javascript" src="dist/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.min.js"></script>
    <script type="text/javascript" src="dist/js/js.cookie-2.1.3.min.js"></script>
    <script type="text/javascript" src="dist/js/loding.js"></script>
    <script type="text/javascript" src="dist/js/FileSaver.js"></script>
    <script type="text/javascript" src="dist/js/Blob.js"></script>
    <title>智慧型簡易行政填報系統</title>
    <script>
        $(document).ready(function () {
            var user = Cookies.get('user');
            if (user != undefined) {
                $.ajax({
                    type: "POST",
                    url: "Formjson/tatleform.ashx",
                    dataType: 'text',
                    async: false,
                    data:
                    {
                        user: user
                    },
                    success: function (e) {
                        var a = e + "";
                        $("#ebody_tbody").append(a);
                    },
                    error: function () {
                        swal({
                            type: 'error',
                            title: '失敗',
                            text: '伺服器延遲，稍後在試。'
                        });
                    }


                });
            }
            $(window).resize(function () {
                wdth = $(window).width();
                if (wdth < 768)
                {

                }
            });
        })
    </script>
    
</head>
<body>
    <!---------------------上方NAV區塊---------------------->
    <nav id="enav" class="bg-dark navbar navbar-expand-md navbar-light bg-light fixed-top"  role="navigation">
        <!--行動裝置-->
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!------------>
        <!--NAV內容-->
        <div class="collapse navbar-collapse" id="navbarCollapse">    
		    <ul id="enav_ul" class="navbar-nav text-md-center nav-justified w-100">
                <li class="nav-item"><a class="nav-link text-white" href="Announcement.aspx">最新消息</a></li>
			    <li class="nav-item"><a class="nav-link text-white" href="lookAnn.aspx">新增公告</a></li>
			    <li class="nav-item"><a class="nav-link text-white" href="lookform.aspx">建立表單</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="form.aspx">填寫表單</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="login.aspx">登出</a></li>
		    </ul>
        </div>

        <!----------->
	</nav>
    <!------------------------------------------------------->
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="card bg-light">
                        <div class="card-header"><h3>所有表單</h3></div>
                        <table class="table table-responsive ">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>公告日期</th>
                                    <th>截止日期</th>
                                    <th>公告人</th>
                                    <th>主旨</th>
                                    <th>連結</th>
                                </tr>
                            </thead>
                            <tbody id="ebody_tbody">
                                
                            </tbody>
                        </table>                     
                    </div>
                    
                    
                </div>
            </div>
        </div>
      
    </form>
</body>
</html>
