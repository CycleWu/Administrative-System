<%@ page language="C#" autoeventwireup="true" inherits="login, App_Web_5ymge2ba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="dist/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.css"/>
    <script type="text/javascript" src="dist/js/jquery.js"></script> 
    <script type="text/javascript" src="https://unpkg.com/popper.js"></script>
    <script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.min.js"></script>
    <script type="text/javascript" src="dist/js/js.cookie-2.1.3.min.js"></script>

    <title>智慧型簡易行政填報系統</title>
    <style>
        @media(max-width : 768px)
        {
            #esix_p
            {
                display:none;
            }
        }
    </style>

</head>
<body id="loginback">
    <form id="loginbackwhite" runat="server">
        <div class="container">
            <div class="row">
                <div class="col"> 
                    <p id="esix_p">　</p><p>　</p>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col">                   
                </div>
                <div class="col-md-6 align-self-center card border-primary" style="max-width: 25rem;">
                    
                        <div class="card-header"><h4 class="card-title">智慧型簡易行政填報系統</h4></div>
                        <div class="card-body text-primary">
                            <h4 class="card-title">Login</h4>
                            <div class="input-group">
                                <p class="card-text">帳號：</p>
                            </div>
                            <div class="input-group">
                                <input id="account" class="form-control"/>
                            </div>
                            <div class="input-group">
                                <p class="card-text">密碼：</p>
                            </div>
                            <div class="input-group">
                                <input id="password" type="password" class="form-control"/>
                            </div>
                            <div class="input-group">
                                 <p class="card-text"></p>
                                 <p class="card-text"></p>
                            </div>
                            <div class="input-group">                                
                                <button id="esix_btn" type="button" class="btn btn-primary">登入</button>
                            </div>
                        </div>
                    
                </div>
                <div class="col">
                </div>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            Cookies.remove('user');
            Cookies.remove('Authorty');
            $("#esix_btn").bind('click', function () {
                $.ajax(
                {
                    type: "POST",
                    url: "Loginjson/login.ashx",
                    dataType: 'text',
                    data:
                    {
                        user: document.getElementById("account").value,
                        pass: document.getElementById("password").value
                    },
                    success: function (e) {
                        if (e == "False")
                        {                            
                            swal({
                                type: 'error',
                                title: '登入失敗',
                                text:'帳號或密碼錯誤。'

                            });
                        }
                        else
                        {
                            Cookies.set('Authority', e);
                            Cookies.set('user', document.getElementById("account").value);
                            location.href = 'Announcement.aspx';
                        };
                        
                        
                    }
                });
            });
            function getcookie()
            {
            
            }
        });
    </script>
</body>
</html>
