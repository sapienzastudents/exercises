import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Redir extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if(request.getParameter("complete")!=null)
        {
            if(request.getParameter("sendred")!=null)
            {
                response.sendRedirect("https://www.manjaro.org"); //Yes
            }
            else if(request.getParameter("forward")!=null)
            {
                if(request.getParameter("req")!=null)
                {
                    RequestDispatcher disp = request.getRequestDispatcher("https://www.manjaro.org");
                    disp.forward(request,response);
                }
                else if(request.getParameter("con")!=null)
                {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("https://www.manjaro.org");
                    disp.forward(request,response);
                }
            }
        }

        else if(request.getParameter("relserv")!=null)
        {
            if(request.getParameter("sendred")!=null)
            {
                response.sendRedirect("/RedirNConf/html/result.html");
            }
            else if(request.getParameter("forward")!=null)
            {
                if(request.getParameter("req")!=null)
                {
                    RequestDispatcher disp = request.getRequestDispatcher("/RedirNConf/html/result.html");
                    disp.forward(request,response);
                }
                else if(request.getParameter("con")!=null)
                {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/RedirNConf/html/result.html");
                    disp.forward(request,response);
                }
            }
        }

        else if(request.getParameter("relcon")!=null)
        {
            if(request.getParameter("sendred")!=null)
            {
                response.sendRedirect("/html/result.html");
            }
            else if(request.getParameter("forward")!=null)
            {   
                if(request.getParameter("req")!=null)
                {
                    RequestDispatcher disp = request.getRequestDispatcher("/html/result.html");
                    disp.forward(request,response);
                }
                else if(request.getParameter("con")!=null)
                {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/html/result.html");
                    disp.forward(request,response);
                }
            }
        }

        else if(request.getParameter("rel")!=null)
        {
            if(request.getParameter("sendred")!=null)
            {
                response.sendRedirect("result.html");
            }
            else if(request.getParameter("forward")!=null)
            {
                if(request.getParameter("req")!=null)
                {
                    RequestDispatcher disp = request.getRequestDispatcher("result.html");
                    disp.forward(request,response);
                }
                else if(request.getParameter("con")!=null)
                {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("result.html");
                    disp.forward(request,response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);
    }
}