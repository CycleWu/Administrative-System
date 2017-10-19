<%@ page language="C#" autoeventwireup="true" inherits="lookform, App_Web_5ymge2ba" %>

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
                    type: "POST",
                    url: "Formjson/selectform.ashx",
                    dataType: 'text',
                    async: false,
                    data:
                    {
                        user: user
                    },
                    success: function (e) {      
                        var a = e + "";
                        $("#ebody_tbody").append(a);
                        var webgoldsQ = document.createElement('script');
                        webgoldsQ.type = 'text/javascript';
                        webgoldsQ.async = true;
                        webgoldsQ.src = 'dist/js/excel_.js';
                        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(webgoldsQ);
                        
                    },
                    error:function()
                    {
                        swal({
                            type: 'error',
                            title: '失敗',
                            text: '帳號或伺服器延遲，稍後在試。'
                        });
                    }
                

                });
            }
            else
            {
                location.href("login.aspx");
            }
            $(".delete_").bind('click', function () {
                var id = $(this).attr("id");
                id = id.slice(1);                
                swal({
                    title: '確定刪除?',
                    text: "資料一旦刪除將會無法復原！",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '確認',
                    cancelButtonText:'取消'
                }).then(function () {
                    $.ajax({                
                        type: "POST",
                        url: "Formjson/delete.ashx",
                        dataType: 'text',
                        async: false,
                        data:
                        {
                            Fid: id,
                        },
                        success: function (e)
                        {
                            swal({
                                title:'刪除成功',
                                text:'資料已成功刪除',
                                type:'success',
                                 allowOutsideClick: false//禁止背景關閉
                            }).then(function () {
                                location.reload();
                            });
                        },
                        error: function ()
                        {
                            swal(
                                '伺服器延遲',
                                '請稍後再嘗試',
                                'error'
                            );
                        }
                    });
                    
                });
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
                        <div class="card-header"><h4>我的表單</h4></div>
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>主旨</th>
                                    <th>發佈日</th>
                                    <th>截止日</th>
                                    <th>連結</th>
                                    <th>Excel</th>
                                    <th>歷史紀錄</th>
                                    <th>刪除</th>
                                </tr>
                            </thead>
                            <tbody id="ebody_tbody">
                                
                            </tbody>
                        </table>
                        <div>
                            <button type="button" onclick="javascript:location.href='newform.aspx'" class="btn btn-success">新建表單</button>
                        </div>
                    </div>
                    <div class="d-none"></div>
                    
                </div>
            </div>
        </div>
      
    </form>
    <script>
        
    </script>
</body>
</html>
