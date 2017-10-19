<%@ page language="C#" autoeventwireup="true" inherits="newform, App_Web_5ymge2ba" %>

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
    <script type="text/javascript" src="dist/js/reload.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.10/sweetalert2.min.js"></script>
    <script type="text/javascript" src="dist/js/js.cookie-2.1.3.min.js"></script>
    <script type="text/javascript" src="dist/js/loding.js"></script>
    <title>智慧型簡易行政填報系統</title>
    
    <style>
        .efour_hr
        {
            margin-top:1vh;
            margin-bottom:2vh;
            border-bottom:1px solid;
        }
    </style>    
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
                <div class="input-group">
                    <span class="input-group-addon">公告人　</span>
                    <input disabled="disabled" id="efour_account" type="text" class="form-control"/>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">公告日期</span>
                    <input id="efour_setdate" type="text" class="datetime form-control"/>                   
                </div>
                <div class="input-group">
                    <span class="input-group-addon">截止日期</span>
                    <input id="efour_enddate" type="text" class="datetime form-control"/>                    
                </div>
                <div class="input-group">
                    <span class="input-group-addon">主旨　　</span>
                    <input id="efour_subject" type="text" class="form-control"/>
                </div> 
                <div class="input-group">
                    <textarea id="efour_article" class="form-control"></textarea>
                </div>     
            </div>
            <div id="efour_newform" class="row">
                <div class="input-group">
                    <span class="input-group-lg">Q1：</span>
                    <input id="qution1" type="text" class="form-control"/>
                </div>
                <div class="input-group">
                    主辦單位：
                    <input id="dep1" type="text" class="form-control"/>
                    <!--下拉式選單A-->
                    <select id="selectA1" class="form-control selectA" >
                        <option>填寫方式</option>
                        <option>個人填寫</option>
                        <option>多人填寫</option>
                        <option>指定帳號填寫</option>
                    </select>
                    <!--下拉式選單B-->
                    <select id="selectB1" class="form-control selectB">
                        <option>限定方式</option>
                        <option>無</option>
                        <option>限定部門</option>
                        <option>指定帳號</option>
                    </select>
                    <input id="input_limit1" type="text" class="form-control efour_limit" value="輸入限制部門或是帳號" />
                    
                </div>
            </div>
            <div class="row">
                <div class="input-group">
                    <button type="button" id="efour_newqu" class="btn btn-outline-dark">新增問題</button>
                </div>
            </div>
            <div class="row">                                          
                <div class="input-group">
                    <button type="button" id="efour_sub" class="btn btn-outline-success">送出表單</button>        
                </div>
            </div>
        </div>
         
    </form>
    <script>
        //日曆
        $('.datetime').datepicker({
            format: "yyyy-mm-dd",
            language: 'zh-TW'
        });
        
    </script> 
    <script>
        
        var i = 2;//Q1.Q2序號
        $(document).ready(function () { 
            var authority = Cookies.get('Authority');
            if (authority == "2") {
                swal({
                    title: '錯誤!',
                    text: '權限不足。',
                    type: 'error',
                    confirmButtonText: '確定'
                }).then(function () {
                    location.href = 'Announcement.aspx';
                });
            }
            var user = Cookies.get('user');
            $("#efour_account").val(user);
            //新增問題                   
            $("#efour_newqu").bind('click', function () {
                if (i < 50)
                {
                    var checkk = check();
                    if (checkk == 1) {
                        $.ajax(
                        {
                            type: "POST",
                            url: "Formjson/newqu.ashx",
                            dataType: 'text',
                            data:
                            {
                                qunum: i
                            },
                            success: function (e) {
                                var a = e + "";//輸出
                                $('#efour_newform').append(a.toString());

                            },

                        });
                        i++;
                        //載入
                        var NowDate = new Date();
                        var h = NowDate.getHours(); var m = NowDate.getMinutes(); var s = NowDate.getSeconds();
                        var total = h + "" + m + "" + s;
                        var webgoldsQ = document.createElement('script');
                        webgoldsQ.type = 'text/javascript';
                        webgoldsQ.async = true;
                        webgoldsQ.src = 'dist/js/reload.js?' + total;
                        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(webgoldsQ);
                    }
                }
                else
                {
                    swal({
                        title: '錯誤!',
                        text: '問題已達上限，請新增其他表單',
                        type: 'error',
                        confirmButtonText: '確定'
                    });
                }
            });
            $("#efour_sub").bind('click', function () {

                var checkk = check();
                var setd = $("#efour_setdate").val();
                var endd = $("#efour_enddate").val();
                setd = setd.substr(0, 4) + setd.substr(5, 2) + setd.substr(8, 2);
                endd = endd.substr(0, 4) + endd.substr(5, 2) + endd.substr(8, 2);
                if (Number(setd) > Number(endd))
                {
                    swal({
                        title: '錯誤!',
                        text: '公告日期不可大於截止日期。',
                        type: 'error',
                        confirmButtonText: '確定'
                    });
                }
                else {
                    if (checkk == 1)
                    {
                        
                        $.ajax({
                            type: "POST",
                            url: "Formjson/sub.ashx",
                            dataType: 'text',
                            async: false,
                            data:
                            {
                                acc: $("#efour_account").val(),
                                set: $('#efour_setdate').val(),
                                end: $('#efour_enddate').val(),
                                sub: $('#efour_subject').val(),
                                con: $('#efour_article').val(),
                            },
                            success: function (e) {
                                if (e == "fail")
                                {
                                    
                                }
                                else if (e == "null") {
                                    swal({
                                        title: '錯誤!',
                                        text: '資料格式錯誤，請重新確認表單。',
                                        type: 'error',
                                        confirmButtonText: '確定'
                                    });
                                }
                                else {
                                    var array = new Array();
                                    qu = [];
                                    off = [];
                                    item = [];
                                    units = [];
                                    write = [];
                                    var c, a;
                                    for (var j = 0; j < i - 1; j++) {
                                        c = Number(j) + 1;
                                        qu[j] = document.getElementById("qution" + c.toString()).value;
                                        off[j] = document.getElementById("dep" + c.toString()).value;
                                        item[j] = document.getElementById("selectB" + c.toString()).value;//限定方式
                                        units[j] = document.getElementById("input_limit" + c.toString()).value;//input限定單位
                                        write[j] = document.getElementById("selectA" + c.toString()).value;//填寫方式
                                        if (qu[j] != "") {
                                            $.ajax(
                                                {
                                                    type: "POST",
                                                    url: "Formjson/subqu.ashx",
                                                    async: false,
                                                    dataType: 'text',
                                                    data:
                                                    {
                                                        id: e,
                                                        Fid: "0" + c,
                                                        qu: qu[j],
                                                        off: off[j],
                                                        item: item[j],
                                                        units: units[j],
                                                        write: write[j],
                                                    },
                                                    success: function (m) {
                                                        swal({
                                                            title: '上傳成功!',
                                                            text: '資料已上傳，',
                                                            type: 'success',
                                                            confirmButtonText: '確定',
                                                            allowOutsideClick: false
                                                        }).then(function () {
                                                            location.href = 'lookform.aspx';
                                                        });
                                                    },
                                                    error: function () {
                                                        swal({
                                                            title: '錯誤!',
                                                            text: '伺服器延遲，稍後在試',
                                                            type: 'error',
                                                            confirmButtonText: '確定'
                                                        });
                                                    }
                                                });
                                        }
                                    }
                                }
                            }
                        });
                    };
                }
                
                
            });
            function check()
            {
                var cc = 0;
                for (var j = 1; j < i; j++)
                {                    
                    var idA = "selectA" + j.toString();
                    var idB = "selectB" + j.toString();
                    if ($("#" + idA).val() == "填寫方式")
                    {
                        swal({
                            title: '錯誤!',
                            text: '請先選擇填寫方式',
                            type: 'error',
                            confirmButtonText: '確定'
                        });
                        cc = 0;
                    }
                    else if ($("#" + idB).val() == "限定方式")
                    {
                        swal({
                            title: '錯誤!',
                            text: '請先選擇限定方式',
                            type: 'error',
                            confirmButtonText: '確定'
                        });
                        cc = 0;
                    }
                    else
                    {
                        cc++;
                    };                    
                };
                if (cc == i - 1) return 1; else return 0;
            }
            
        });
    </script>
</body>
</html>
