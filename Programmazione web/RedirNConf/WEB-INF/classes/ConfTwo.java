import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ConfTwo extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        ServletConfig local = getServletConfig();
        ServletContext global = local.getServletContext();

        Enumeration<String> locp = local.getInitParameterNames();
        Enumeration<String> globp = global.getInitParameterNames();


        out.println("<html><body>");
        out.println("<table border=\"1\"><tr><th colspan=\"2\">Local Config</th></tr>");
        while(locp.hasMoreElements())
        {
            String p = locp.nextElement();
            out.println("<tr><td>"+p+"</td><td>"+ local.getInitParameter(p) +"</td></tr>");
        }
        out.println("</table><br />");

        out.println("<table border=\"1\"><tr><th colspan=\"2\">Global Config</th></tr>");
        while(globp.hasMoreElements())
        {
            String p = globp.nextElement();
            out.println("<tr><td>"+p+"</td><td>"+ global.getInitParameter(p) +"</td></tr>");
        }
        out.println("</table></body></html>");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);
    }
}