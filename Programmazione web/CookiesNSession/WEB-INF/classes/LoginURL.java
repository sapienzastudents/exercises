import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginURL extends HttpServlet
{
    private Map<String,String> logins;

    public void init()
    {
        logins = new TreeMap<String,String>();
        logins.put("grinch", "passwd");
        logins.put("user1", "pass1");
        logins.put("user2", "pass2");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        //Check if user required logout
        if(request.getParameter("logout")!=null)
        {
            HttpSession session = request.getSession();
            session.invalidate();

            out.println("<html><head><title>Logged out</title></head>");
            out.println("<body><h2>You have been logged out</h2>");
            out.println("<p>session has been invalidate...</p>");
            out.println("<p>if you want lo login <a href=\"LoginURL\">Click here</a></p>");
            out.println("<hr/><h5>Session was manteined with: "+ (request.isRequestedSessionIdFromCookie()? "Cookie":"URL Encoding") +"<h5>");
            return;
        }
        String username = request.getParameter("Username");
        
        //Check if username exist
        if(username!=null)
        {
            if(logins.containsKey(username) && logins.get(username).equals(request.getParameter("Password")))
            {
                HttpSession session = request.getSession(true);
                session.removeAttribute("username");
                session.setAttribute("username",username);
            }
        }

        username = (String)request.getSession().getAttribute("username");
        if(username==null)
        {
            out.println("<html><head><title>Log in page</title></head>");
            out.println("<body><h2>It's necessary log in..</h2>");
            out.println("<form action=\"../servlet/LoginURL\" method=\"POST\">");
            out.println("<input type=\"text\" name=\"Username\">Username<br/>");
            out.println("<input type=\"password\" name=\"Password\">Password<br/>");
            out.println("<input type=\"submit\" value=\"LoginURL\"></form></body></html>");
            return;
        }

        else
        {
                out.println("<html><head><title>Welcome</title></head>");
                out.println("<body><h2>You are logged as "+ username +"</h2>");
                out.println("<p>Select one of this page:</p>");
                out.println("<p><a href="+ response.encodeURL("../html/page1_url") +">Pagina 1</a></p>");
                out.println("<p><a href="+ response.encodeURL("../html/page2_url") +">Pagina 2</a></p>");
                out.println("<p><a href="+ response.encodeURL("../servlet/LoginURL?logout") +">Logout</a></p>");
                out.println("<hr/><h5>Session was manteined with: "+ (request.isRequestedSessionIdFromCookie()? "Cookie":"URL Encoding") +"<h5>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);
    }
}