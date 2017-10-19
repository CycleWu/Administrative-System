<%@ page language="C#" autoeventwireup="true" inherits="index, App_Web_5ymge2ba" %>

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
    <script type="text/javascript" src="dist/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="dist/js/bootstrap-datepicker.zh-TW.js"></script> 
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.min.js"></script>
    <script type="text/javascript" src="dist/js/js.cookie-2.1.3.min.js"></script>
    <script type="text/javascript" src="dist/js/loding.js"></script>
    <title>智慧型簡易行政填報系統</title>
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
        <!--公告大綱-->
        <div class="row">
            <div class="col">
                <!--公告日期-->
                <div class="input-group etwo_input-group">
                    <span class="input-group-addon">公告日期</span>
                    <!--引用datepicker選擇時間-->
                    <input id="datetime" class="form-control"/>
                    <script>
                        $('#datetime').datepicker(
                            {
                                format: "yyyy-mm-dd",
                                language: 'zh-TW'
                            });
                    </script>   
                    <!-------------------------->
                </div>
                <div class="input-group etwo_input-group">
                    <span class="input-group-addon">限定部門</span>
                    <input id="etwo_shan" class="form-control"/>
                </div>
                <!------------>

                <!--公告部門-->
                <div class="input-group etwo_input-group">
                    <span class="input-group-addon">公告部門</span>
                    <!--程式抓取公告部門放入-->
                    <input disabled="disabled" id="etwo_office" class="form-control"/>
                </div>
                <!------------>

                <!--公告人-->
                <div class="input-group etwo_input-group">
                    <span class="input-group-addon">公告人　</span>
                    <!--程式抓取公告人放入-->
                    <input disabled="disabled" id="etwo_name" class="form-control"/>
                </div>
                <!---------->

                <!--主旨-->
                <div class="input-group etwo_input-group">
                    <span class="input-group-addon">主旨　　</span>
                    <input id="etwo_5j353" class="form-control"/>
                </div>
                <!-------->

            </div>
        </div>
        <!------------>
        <!--公告內文-->
        <div class="row">
            <div class="col">               
                <textarea id="etwo_article" class="form-control"></textarea>
            </div>
        </div>
        <!------------>
        <!--送出按鈕-->
        <p></p>
        <div class="row">
            <div class= "col">
                <button id="setann" type="button" class="btn btn-outline-success">送出公告</button>
            </div>
        </div>
        <!------------>
    </div>
    </form>
    <script>
        $(document).ready(function () {
            var user = Cookies.get('user');     
            var authority = Cookies.get('Authority');
            if (authority == "2") {
                swal({
                    title: '錯誤!',
                    text: '權限不足。',
                    type: 'error',
                    allowOutsideClick: false,
                    confirmButtonText: '確定'
                }).then(function () {
                    location.href = 'Announcement.aspx';
                });
            }
            if (user != undefined)
            {
                $.ajax({
                    type: "post",
                    url: "Announ/postjson.ashx",
                    dataType: 'text',
                    data:
                    {
                        user: user,
                        id: "1",
                    },
                    success: function (name) {

                        input = name.split(",");
                        if (input != "fail")
                        {
                            $("#etwo_name").val(input[0]);
                            $("#etwo_office").val(input[1]);
                            
                        }
                        else
                        {
                            errorr();
                        }
                    }
                });
            }
            else
            {
                errorr();
            }
            function errorr()
            {
                swal({
                    type: 'error',
                    title: '登入時效已過',
                    text: '請重新登入。',
                    allowOutsideClick: false,

                }).then(function () {
                    location.href = 'login.aspx';
                });
            }

            $("#setann").bind('click', function () {
                if ($("#etwo_shan").val() == "若不需限定請勿輸入") { $("#etwo_shan").val("");}
                $.ajax(
                {
                    type: "POST",
                    url: "Announ/postjson.ashx",
                    dataType: 'text',
                    data:
                    {
                        id: "2",
                        user: user,
                        setdate: $("#datetime").val(),
                        ee: $("#etwo_5j353").val(),
                        art: $("#etwo_article").val(),
                        no: $("#etwo_shan").val()
                    },
                    success: function (e)
                    {
                        if (e != 8)
                        {
                            swal({
                                type: 'success',
                                title: '發佈成功!',
                            
                                allowOutsideClick: false,

                            }).then(function () {
                                location.href = 'lookAnn.aspx';
                            });
                        }
                        else
                        {
                            swal({
                                type: 'error',
                                title: '資料格式錯誤!',

                                allowOutsideClick: false,

                            });
                        }
                    }
                    
                });
               
            });
            var tra, val, limitId;
            val = "若不需限定請勿輸入";
            $("#etwo_shan").val(val);
            $("#etwo_shan").focus(function ()//被點擊狀態時
            {               
                tra = $("#etwo_shan").val();
                if (tra == val) {
                    tra = "";
                    $("#etwo_shan").val("");//清空
                    /*
                    var e = event.srcElement; //讓游標停留在最後一個字
                    var r = e.createTextRange();
                    r.moveStart("character", e.value.length);
        
                    r.collapse(true);
                    r.select();
                    */
                }
            });
            $("#etwo_shan").blur(function () {//不在被輸入時(不被關注)       
                //判斷tra是否為空，若是空的話則顯示預設樣式
                if ($("#etwo_shan").val() == "") {
                    $("#etwo_shan").val(val);
                    //$(limitId).css("color", "#bfbfbf");
                }
                tra = "";
            });
        });
    </script>
</body>
</html>
