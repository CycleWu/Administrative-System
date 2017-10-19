<%@ WebHandler Language="C#" Class="myann" %>

using System;
using System.Web;
using System.Data;

public class myann : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string id = context.Request.Form["user"].ToString();
        InsertForm inse = new InsertForm();
        DataTable re = inse.selectmyann(id);
        string form="",test;
        string ree = "";
        int i = 0;
        
        while (true)
        {
            try
            {
                test = re.Rows[i][4].ToString();
                int j = 7;
                while(ree != "上")
                {
                    ree = re.Rows[i][2].ToString().Substring(j,1);
                    j++;
                }
                ree = "";
                string toolong = re.Rows[i][1].ToString();
                if (re.Rows[i][1].ToString().Length > 37) toolong = re.Rows[i][1].ToString().Substring(0, 37) + "..."; else toolong = re.Rows[i][1].ToString();
                form += "<tr>";
                form += "<th>" + (i + 1) + "</th>" +
                        "<td>" + toolong + "</td>" +
                        "<td>" + re.Rows[i][2].ToString().Substring(0, j-1) + "</td>" +
                        "<td><a href='annlook.aspx?id="+ re.Rows[i][0] +"'><span class='oi oi-external-link'></span></a>" + "</td>" +
                        "<td><a href='#' class='delete_' id='e"+re.Rows[i][0] +"'><span class='oi oi-x'></span></a>" + "</td>";
                form += "</tr>";
                i++;j = 7;
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