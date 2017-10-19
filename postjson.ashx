<%@ WebHandler Language="C#" Class="postjson" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class postjson : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string id = context.Request.Form["id"].ToString();
        if (id == "1")
        {
            try
            {
                string user = context.Request.Form["user"].ToString();
                InsertForm inser = new InsertForm();
                DataTable dt = inser.check(user);
                context.Response.Write(dt.Rows[0][3]+ "," +dt.Rows[0][7] + "," + dt.Rows[0][1]);
            }
            catch
            {
                context.Response.Write("fail");
            };
        }
        else
        {

                string user = context.Request.Form["user"].ToString();//使用者帳號
                string setdate = context.Request.Form["setdate"].ToString();//公告時間
                string ee = context.Request.Form["ee"].ToString();//主旨
                string art = context.Request.Form["art"].ToString();//文章
                string no = context.Request.Form["no"].ToString();//限制
                InsertForm inser = new InsertForm();
                long con = inser.inserann(user, setdate, ee, art,no);
                context.Response.Write(con);
            }
        }

    public bool IsReusable {
        get {
            return false;
        }
    }

}