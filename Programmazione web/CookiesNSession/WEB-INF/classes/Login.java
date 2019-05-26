import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet
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
            out.println("<p>if you want lo login <a href=\"Login\">Click here</a></p>");
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
            out.println("<form action=\"../servlet/Login\" method=\"POST\">");
            out.println("<input type=\"text\" name=\"Username\">Username<br/>");
            out.println("<input type=\"password\" name=\"Password\">Password<br/>");
            out.println("<input type=\"submit\" value=\"Login\"></form></body></html>");
            return;
        }

        else
        {
                out.println("<html><head><title>Welcome</title></head>");
                out.println("<body><h2>You are logged as "+ username +"</h2>");
                out.println("<p>Select one of this page:</p>");
                out.println("<p><a href=\"../html/page1\">Pagina 1</a></p>");
                out.println("<p><a href=\"../html/page2\">Pagina 2</a></p>");
                out.println("<p><a href=\"../servlet/Login?logout\">Logout</a></p>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);
    }
}