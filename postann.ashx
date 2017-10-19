f<%@ WebHandler Language="C#" Class="postann" %>

using System;
using System.Web;
using System.Data;
public class postann : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string user = context.Request.Form["user"].ToString();
        InsertForm inse = new InsertForm();
        DataTable re = inse.check(user);
        DataTable username;
        string buman = re.Rows[0][7].ToString();
        re = inse.selectAnn(buman,user);
        int i = 0;
        string test = "", form = "";
        string ree = "",subject="",text;
        int l = 0;
        while(i<6)
        {
            try
            {
                test = re.Rows[i][0].ToString();
                username = inse.check(re.Rows[i][3].ToString());
                while(ree != "上")
                {
                    ree = re.Rows[i][2].ToString().Substring(l,1);
                    l++;
                }
                if(re.Rows[i][1].ToString().Length>20)
                {
                    subject = re.Rows[i][1].ToString().Substring(0, 20) + "...";
                }
                else
                {
                    subject = re.Rows[i][1].ToString();
                }
                if(re.Rows[i][4].ToString().Length>20)
                {
                    text = re.Rows[i][4].ToString().Substring(0, 20) + "...";
                }
                else
                {
                    text = re.Rows[i][4].ToString();
                }
                if(i%2==0)
                {
                    form +=
                            "<div class='row w-100'>" +
                                "<div class='col-md card bg-light w-100 border border-secondary rounded'>" +
                                    "<div class='input-group m-1'>" +
                                        "公告日期：" + re.Rows[i][2].ToString().Substring(0,l-1) +
                                    "</div>"+
                                    "<div class='input-group m-1'>" +
                                        "公告人：" + username.Rows[0][3] +
                                    "</div>"+
                                    "<div class='input-group m-1'>" +
                                        "主旨：" + subject +
                                    "</div>"+
                                    "<div class='input-group m-1'>" +
                                        "內文：" + text +
                                    "</div>" +
                                    "<a href='annlook.aspx?id=" + re.Rows[i][0] + "' class='btn btn-outline-info m-1'>閱讀</a>" +
                                "</div>";


                }
                else
                {
                    form +=
                                "　<div class='col-md card bg-light w-100 border border-secondary rounded'>" +
                                    "<div class='input-group m-1'>" +
                                        "公告日期：" + re.Rows[i][2].ToString().Substring(0,l-1) +
                                    "</div>" +
                                    "<div class='input-group m-1'>" +
                                        "公告人：" + username.Rows[0][3] +
                                    "</div>" +
                                    "<div class='input-group m-1'>" +
                                        "主旨：" + subject +
                                    "</div>" +
                                    "<div class='input-group m-1'>" +
                                        "內文：" + text +
                                    "</div>" +
                                    "<a href='annlook.aspx?id=" + re.Rows[i][0].ToString() + "' class='m-1 btn btn-outline-info'>閱讀</a>" +
                                "</div>" +
                            "</div><br/>";
                }

            }
            catch
            {
                if(i%2 != 0)
                {
                    form += "</div><br/>";
                }
                break;
            }
            i++;
            l = 0;
            ree = "";
        }
        if(i == 6)
        {
            form +=
                    "<div class='row w-100' style='border:none'><div style='border:none' class='col-md card w-100'>" +
                        "<a href='totalann.aspx' class='btn btn-outline-info' style='height:5vh;font-size:20px'>其　他　公　告</a>" +
                    "</div></div>";
        }
        context.Response.Write(form);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}