import java.util.*;
import java.io.*;

import javax.lang.model.util.ElementScanner6;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if(request.getUserPrincipal()==null)
        {
            out.println("<html><body>");
            out.println("<h4>Is necessary login..</h4>");
            out.println("<p><a href=\"protectedU12\">Click here</a></p>");
            out.println("</body></html>");
            return;
        }

        if(request.getParameter("logout") != null )
        {
            if(!request.getAuthType().equals("FORM"))
            {
                out.println("<html><body>");
                out.println("<h4>Seem logout but isn't possible</h4>");
                out.println("You are logged as: "+request.getRemoteUser());
                out.println("<p><a href=\"protectedU12\">Click here</a></p>");
                out.println("</body></html>");
                return;
            }
            else
            {
                request.getSession().invalidate();
                response.sendRedirect(request.getRequestURI());
            }   
        }

        String principal = request.getUserPrincipal().getName();
        String user = request.getRemoteUser();
        out.println("<html><head><title>Welcome "+principal+"</title></head><body>");
        out.println("You are logged as "+user+" with auth method: "+request.getAuthType());
        
        if(request.isUserInRole("user1"))
            out.println("<p>You have low profile man</p>");

        else
            out.println("<p>You have high profile, you're awesome!</p>");

        if(!request.getAuthType().equals("FORM"))
            out.println("<p>you can logout <a href=\"e:e@localhost:8080"+request.getRequestURI()+"\">Clicking here</a></p>");
        
        else
            out.println("<p>you can logout <a href=\""+request.getRequestURI()+"?logout\">Clicking here</a></p>"); 
        
        out.close();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
            doPost(request,response);
    }
}