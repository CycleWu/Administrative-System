<%@ page language="C#" autoeventwireup="true" inherits="FormFace, App_Web_5ymge2ba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.0-RC3/css/bootstrap-datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="dist/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.css"/>
    <script type="text/javascript" src="dist/js/jquery.js"></script>
    <script type="text/javascript" src="https://unpkg.com/popper.js"></script>
    <script type="text/javascript" src="dist/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.min.js"></script>
    <script type="text/javascript" src="dist/js/js.cookie-2.1.3.min.js"></script>
    <script type="text/javascript" src="dist/js/loding.js"></script>
    <title>智慧型簡易行政填報系統</title>
    <style>
        body
        {
            margin-top:-2vh;
        }
    </style>
    <style>
        .efour_hr
        {
            margin-top:1vh;
            margin-bottom:2vh;
            border-bottom:1px solid;
        }
        
    </style>
    
</head>

<body >
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
    <p></p>
    <form id="form1" runat="server">
        <div class="container border border-secondary rounded" id="context_form">
                   
        </div>
    </form> 
    <script>
        function ans() {                
            var user = Cookies.get('user');
            href_ = location.search;
            //href_ = ?id=12345678
            href_ = href_.substr(4);
            var totle = $("#total").val();
            var proid = "";
            for (var i = 1; i <= totle; i++) {
                var hre;
                if (i < 10) hre = "ans" + href_ + "0" + i; else hre = "ans" + href_ + "" + i;
                if (document.getElementById(hre))
                {
                    if (i < 10) proid = href_ + "0" + i; else proid = href_ + "" + i;
                    $.ajax
                    ({
                        type: "POST",
                        url: "Formjson/answer.ashx",
                        dataType: 'text',
                        data:
                        {
                            proid: proid,//porject_id
                            proidtext: document.getElementById(hre).value,//text
                            user: user,//user
                        },
                        success: function (check) {
                            if (check == 8)
                            {
                                swal({
                                    title: '錯誤!',
                                    text: '資料格式錯誤',
                                    type: 'error',
                                    confirmButtonText: '確定',
                                    allowOutsideClick: false
                                    });
                            }
                            else
                            {
                                swal({
                                    title: '成功!',
                                    text: '資料已上傳',
                                    type: 'success',
                                    confirmButtonText: '確定',
                                    allowOutsideClick: false
                                }).then(function () {
                                    location.href = 'form.aspx';
                                });
                            }
                        }
                    });
                };

            };

            
        };
        $(document).ready(function ()
        {
            
            href_ = location.search;
            //href_ = ?id=12345678
            href_ = href_.substr(4);
            if (href_ == "")
            {             
                location.href = 'Announcement.aspx';
            }            
            else
            {
                var user = Cookies.get('user');
                if (user != undefined) {
                    $.ajax({
                        type: "POST",
                        url: "Formjson/form.ashx",
                        dataType: 'text',
                        data:
                        {
                            href: href_,
                            user: user,
                        },
                        success: function (form) {
                            if (form != "Fail")
                            {
                                $("#context_form").append(form);
                                if ($("#du").val() == "0")
                                {
                                    swal({
                                        title: '錯誤!',
                                        text: '不需填寫此表單',
                                        type: 'error',
                                        confirmButtonText: '確定',
                                        allowOutsideClick: false
                                    }).then(function () {
                                        location.href = 'Announcement.aspx';
                                    });;
                                }
                            }
                            else
                            {
                                location.href = 'Announcement.aspx';
                            }
                        }
                    });
                }
                else
                {
                    location.href = 'login.aspx';
                };
            };
        });
    </script>
</body>
</html>
