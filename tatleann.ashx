<%@ WebHandler Language="C#" Class="tatleann" %>

using System;
using System.Web;
using System.Data;
public class tatleann : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string id = context.Request.Form["user"].ToString();
        InsertForm inse = new InsertForm();
        DataTable user = inse.check(id);//0.7部門 使用者
        DataTable re = inse.selectallann(id,user.Rows[0][7].ToString());//re 為所有公告 去除使用者不可見


        string form="",test;
        string ree = "";
        int i = 0;
        while (true)
        {
            try
            {
                test = re.Rows[i][4].ToString();//偵測資料
                user = inse.check(re.Rows[i][3].ToString());//公告人  0 7為公告部門 0 3為公告人
                int j = 7;
                while (ree != "上")
                {
                    ree = re.Rows[i][2].ToString().Substring(j, 1);
                    j++;
                }//抓長度
                string toolong = re.Rows[i][1].ToString();
                if (re.Rows[i][1].ToString().Length > 37) toolong = re.Rows[i][1].ToString().Substring(0, 37) + "..."; else toolong = re.Rows[i][1].ToString();
                ree = "";
                //輸出
                form += "<tr>";
                form += "<th>" + (i + 1) + "</th>" +
                        "<td>" + re.Rows[i][2].ToString().Substring(0, j - 1) + "</td>" +     //日期
                        "<td>" + user.Rows[0][7] + "</td>" +
                        "<td>" + user.Rows[0][3] + "</td>" +
                        "<td>" + toolong + "</td>" +
                        "<td><a href='annlook.aspx?id=" + re.Rows[i][0] + "'><span class='oi oi-external-link'></span></a>" + "</td>";
                form += "</tr>";
                i++; j = 7;
            }
            catch
            {
                context.Response.Write(form);
                break;
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}