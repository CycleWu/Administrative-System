<%@ page language="C#" autoeventwireup="true" inherits="authority, App_Web_5ymge2ba" %>

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

</head>
<script>
    $(document).ready(function () {
        var authority = Cookies.get('Authority');
        var user = Cookies.get('user');
        if (authority != "0")
        {
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
        else
        {
            $.ajax({
                type: "POST",
                url: "Authority/server.ashx",
                dataType: 'text',
                data:
                {
                    user:user
                },
                success: function (form)
                {
                    $("#ebody_tbody").append(form);
                }
            })
        }
        
    })
</script>
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
                        <div class="card-header"><h3>權限管理</h3></div>
                        <table id="mytable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>#</th>                                    
                                    <th>帳號</th>
                                    <th>姓名</th>
                                    <th>部門</th>
                                    <th>科別</th>
                                    <th>權限</th>
                                </tr>
                            </thead>
                            <tbody id="ebody_tbody">
                                
                            </tbody>
                        </table>
                        <div>
                            <div class="row">
                                <div class="col-xl-1">
                                    <button type="button" id="inserat" class="btn btn-success">確認修改</button>
                                </div>
                                
                                <div class="col">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal">新增會員</button>
                                </div>
                            </div>
                        </div>
                    </div>                                   
                </div>
            </div>
        </div>
        <!--新增部門區塊-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">新增會員</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body"><!--內容-->
                        <div class="input-group">
                            姓名
                        </div>
                        <div class="input-group">
                            <input id="e_name" class="form-control"/>
                        </div>
                        <div class="input-group">
                            帳號
                        </div>
                        <div class="input-group">
                            <input id="e_account" class="form-control"/>
                        </div>
                        <div class="input-group">
                            密碼
                        </div>
                        <div class="input-group">
                            <input id="e_password" class="form-control"/>
                        </div>
                        <div class="input-group">
                            確認密碼
                        </div>
                        <div class="input-group">
                            <input id="e_checkpassword" class="form-control"/>
                        </div>
                        <div class="input-group">
                            性別
                        </div>
                        <div class="input-group">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"/>男
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"/> 女
                                </label>
                            </div>
                        </div>
                        <div class="input-group">
                            所屬部門
                        </div>
                        <div class="input-group">
                            <input id="e_buman" class="form-control"/>
                        </div>
                        <div class="input-group">
                            所屬科別/職位
                        </div>
                        <div class="input-group">
                            <input id="e_branch" class="form-control"/>
                        </div>
                        <div class="input-group">
                            權限設定
                        </div>
                        <div class="input-group">
                            <select class="custom-select" id="e_authority">                                
                                <option value="1">一般用戶</option>
                                <option value="2">表格建立者</option>
                                <option value="3">停止用戶</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="button" id="newacc" class="btn btn-primary">儲存送出</button>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <script>
        $("#inserat").bind('click', function () {
            var num = $("#totle").val();

            for (var i = 1; i <= num; i++) {
                var auth = document.getElementById("select" + i).selectedIndex + 1;
                var user = document.getElementById("number" + i).innerHTML;

                $.ajax
                    ({
                        type: "POST",
                        url: "Authority/update.ashx",
                        dataType: 'text',
                        data:
                        {
                            auth: auth,
                            user: user,//user
                        },
                        success: function () {
                            swal({
                                title: '修改成功!',
                                type: 'success',
                                allowOutsideClick: false,
                                confirmButtonText: '確定'
                            }).then(function () {
                                location.reload();
                            });
                        }
                    });
            };
        });
        $("#newacc").bind('click', function () {
            var name = document.getElementById("e_name").value;
            var account = document.getElementById("e_account").value;
            var password = document.getElementById("e_password").value;
            var checkpassword = document.getElementById("e_checkpassword").value;
            var gender;
            if (document.getElementById("inlineRadio1").checked)
            {
                gender = "0";
            }
            else if (document.getElementById("inlineRadio2").checked)
            {
                gender = "1";
            }
            else
            {
                gender = "fail";
            }            
            var buman = document.getElementById("e_buman").value;
            var branch = document.getElementById("e_branch").value;
            var authority = document.getElementById("e_authority").selectedIndex;
            if (authority = "0")
            {
                authority = 2;
            }
            else if (authority = "1")
            {
                authority = 1;
            }
            else
            {
                authority = "3";
            }
            //alert(name + "," + account + "," + password + "," + checkpassword + "," + gender + "," + buman + "," + branch + "," + authority);
            if (name != "" && account != "" && password != "" && checkpassword != "" && gender != "fail" && buman != "" && branch != "")
            {
                if (password != checkpassword)
                {
                    swal({
                        title: '錯誤!',
                        type: 'error',
                        text: '密碼欄位不相同',
                        allowOutsideClick: false,
                        confirmButtonText: '確定'
                    }).then(function () {
                        location.reload();
                    });
                }
                else
                {//送出
                    $.ajax
                    ({
                        type: "POST",
                        url: "Authority/newacc.ashx",
                        dataType: 'text',
                        data:
                        {
                            name: name,
                            account: account,
                            password: password,
                            gender: gender,
                            buman: buman,
                            branch: branch,
                            authority: authority,
                        },
                        success: function (e) {
                            if (e == "8")
                            {
                                swal({
                                    title: '錯誤!',
                                    type: 'error',
                                    text:'資料文字過長',
                                    allowOutsideClick: false,
                                    confirmButtonText: '確定'
                                })
                            }
                            else
                            {
                                swal({
                                    title: '修改成功!',
                                    type: 'success',
                                    allowOutsideClick: false,
                                    confirmButtonText: '確定'
                                }).then(function () {
                                    location.reload();
                                });
                            }
                            
                        }
                    });
                }

            }
            else
            {
                swal({
                    title: '錯誤!',
                    type: 'error',
                    text:'資料欄位不可空白',
                    allowOutsideClick: false,
                    confirmButtonText: '確定'
                }).then(function () {
                    location.reload();
                });
            }           
        });
    </script>
</body>
</html>
