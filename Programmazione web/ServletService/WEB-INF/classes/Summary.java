import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Summary extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Enumeration<String> param= request.getParameterNames();

        out.println("<html><head><title>Response</title></head>");
        out.println("<body><h3>Hi! This page is created by servlet you have been call</h3>");
        out.println("<p>Your Address is: "+ request.getLocalAddr() +" and port: "+request.getLocalPort()+"</p>");
        out.println("<p>The method used is: "+ request.getMethod() +"</p>");
        while(param.hasMoreElements())
        {  
            String p = param.nextElement().toString();
            if(p.contains("cb"))
            {
                out.println("<b>Language:</b> "+request.getParameter(p)+"<br/>");
            }
            else
            {
                out.println("<b>"+p +":</b> "+request.getParameter(p)+"<br/>");
            }
        }
        out.println("</body></html>");
        out.close();
    }
}