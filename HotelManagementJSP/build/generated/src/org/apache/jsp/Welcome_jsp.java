package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Welcome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Hotel Management system</title>\n");
      out.write("        <style>\n");
      out.write("        body{\n");
      out.write("            font-family: sans-serif;\n");
      out.write("            background-image: url(bg-pattern.jpg);\n");
      out.write("            background-size: cover;\n");
      out.write("        }    \n");
      out.write("        #navigation {\n");
      out.write("            background-image: url(../images/bg-navigation.png);\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-position: top center;\n");
      out.write("            background-size: cover;\n");
      out.write("            clear: both;\n");
      out.write("            height: 70px;\n");
      out.write("    /*\twidth: 760px;*/\n");
      out.write("            margin: 0 auto;\n");
      out.write("            padding: 1px;\n");
      out.write("        }\n");
      out.write("        #navigation ul {\n");
      out.write("        /*\tdisplay: inline-block;*/\n");
      out.write("        /*\twidth: 560px;*/\n");
      out.write("                position: absolute;\n");
      out.write("                right: 30%;\n");
      out.write("                list-style: none;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("        }\n");
      out.write("        #navigation li {\n");
      out.write("                float: left;\n");
      out.write("        /*\tbackground-position: 0 -118px;*/\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                height: 49px;\n");
      out.write("                width: 122px;\n");
      out.write("                margin: 0;\n");
      out.write("                padding-left: 1px;\n");
      out.write("                text-align: center;\n");
      out.write("        }\n");
      out.write("        #navigation li:first-child {\n");
      out.write("                background: none;\n");
      out.write("                margin-left: 0;\n");
      out.write("                padding-left: 0;\n");
      out.write("        }\n");
      out.write("        #navigation li a {\n");
      out.write("                color: #fff;\n");
      out.write("                display: block;\n");
      out.write("                font: bold 14px/48px Arial, Helvetica, sans-serif;\n");
      out.write("                height: 0px;\n");
      out.write("                text-transform: uppercase;\n");
      out.write("        }\n");
      out.write("        #navigation li a:hover {\n");
      out.write("                background-position: 0 -59px;\n");
      out.write("                color: #6d6157;\n");
      out.write("        }\n");
      out.write("        #navigation li.selected a {\n");
      out.write("                background-position: 0 0;\n");
      out.write("                color: grey;\n");
      out.write("        }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            if(session.getAttribute("user")==null)
            {
              response.sendRedirect("login.jsp");
            }
        
      out.write("\n");
      out.write("        <div id=\"background\">\n");
      out.write("\t\t<div id=\"page\">\n");
      out.write("\t\t\t<div id=\"header\">\n");
      out.write("<!--\t\t\t\t<div id=\"logo\">\n");
      out.write("\t\t\t\t\t<a href=\"index.html\"><img src=\"images/logo.jpg\" alt=\"LOGO\" height=\"112\" width=\"118\"></a>\n");
      out.write("\t\t\t\t</div>-->\n");
      out.write("\t\t\t\t<div id=\"navigation\">\n");
      out.write("\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t<li class=\"selected\">\n");
      out.write("\t\t\t\t\t\t\t<a href=\"Welcome.jsp\">Home</a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<a href=\"Rooms.jsp\">Rooms</a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<a href=\"Customer.jsp\">Customer</a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<a href=\"Booking.jsp\">Booking</a>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
