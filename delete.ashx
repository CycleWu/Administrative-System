<%@ WebHandler Language="C#" Class="delete" %>

using System;
using System.Web;

public class delete : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string Aid = context.Request.Form["Aid"];
        InsertForm inse = new InsertForm();
        long check = inse.deleteann(Aid);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}