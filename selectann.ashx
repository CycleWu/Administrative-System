<%@ WebHandler Language="C#" Class="selectann" %>

using System;
using System.Web;
using System.Data;

public class selectann : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string href = context.Request.Form["href"].ToString();
        string user = context.Request.Form["user"].ToString();
        InsertForm inse = new InsertForm();
        InsertForm buman = new InsertForm();
        DataTable bum = buman.check(user);
        DataTable username;
        string getbuman = bum.Rows[0][7].ToString();//此帳號部門
        DataTable selec = inse.postann(href,getbuman,user);
        username = inse.check(selec.Rows[0][3].ToString());
        string form = "";
        try
        {
            form = selec.Rows[0][1].ToString();
            string ree = "";
            int j = 7;
            while(ree != "上")
            {
                ree = selec.Rows[0][2].ToString().Substring(j,1);
                j++;
            }
            form = "<div class='row'>" +
                       "<div class='input-group'>" +
                          "<span class='input-group-addon'>公告人　</span>" +
                          "<input class='eff_back form-control' disabled='disabled' value='" + username.Rows[0][3] + "'/>" +
                       "</div>" +
                       "<div class='input-group'>" +
                          "<span class='input-group-addon'>公告日期</span>" +
                          "<input class='eff_back form-control' disabled='disabled' value='" + selec.Rows[0][2].ToString().Substring(0, j - 1) + "'/>" +

                       "</div>" +
                       "<div class='input-group'>" +
                          "<span class='input-group-addon'>主旨　　</span>" +
                          "<input class='eff_back form-control' disabled='disabled' value='" + selec.Rows[0][1] + "'/>" +
                       "</div>" +

                       "<div class='input-group'><!--artile-->" +
                        "<textarea class='eff_back form-control' id='etwo_article'  valign='top' disabled='disabled'>" + selec.Rows[0][4].ToString() + "</textarea>"+
                    "</div></div>" + "<div id='efour_newform' class='row'>";
            context.Response.Write(form);
        }
        catch
        {
            context.Response.Write("Fail");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}