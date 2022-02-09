package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.Gender;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>SignUp Form</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"resident\">\n");
      out.write("        <div class=\"lgin\"><h1><a href=\"login.html\">LOGIN</a></h1></div>\n");
      out.write("        <section id=\"form\">\n");
      out.write("            <div class=\"resident_form\">\n");
      out.write("                <h1>SIGN UP</h1></div>\n");
      out.write("            <div class=\"main\">        \n");
      out.write("                <form action=\"StaffServlet\" method=\"POST\">\n");
      out.write("                    <div id= \"name\">\n");
      out.write("                        <div id= \"left\">\n");
      out.write("                            ");

                              Gender gnd[] =Gender.values();
                            
      out.write("\n");
      out.write("                            <label >Firstname</label></br>\n");
      out.write("                            <input type=\"text\" name=\"firstName\" placeholder=\" First Name\"/></br>\n");
      out.write("                            <label >Username</label></br>\n");
      out.write("                            <input type=\"text\" name=\"userName\" placeholder=\" Username\"/></br>\n");
      out.write("                            <label>Phone Number</label></br>\n");
      out.write("                            <input type=\"tel\" name=\"phone\" placeholder=\"+250\"/></br>\n");
      out.write("                            <label>Gender</label></br>\n");
      out.write("                            <select name=\"Gender\" >\n");
      out.write("                                ");

                                  for (Gender g:gnd){
                                
      out.write("\n");
      out.write("                                <option>");
      out.print(g.toString());
      out.write("</option>\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                            </select></br>\n");
      out.write("                        </div>\n");
      out.write("                        <div id= \"right\">\n");
      out.write("                            <label >Lastname</label></br>\n");
      out.write("                            <input type=\"text\" name=\"lastName\" placeholder=\" Last Name\"/></br>\n");
      out.write("                            <label>E-mail</label></br>\n");
      out.write("                            <input type=\"email\" name=\"email\" placeholder=\"E-mail\"/></br>\n");
      out.write("                            <label>Password</label></br>\n");
      out.write("                            <input type=\"password\" name=\"password\" placeholder=\"********\"/></br>\n");
      out.write("                            <!--                <label>Confirm password</label></br>\n");
      out.write("                                            <input type=\"password\" name=\"passwordConfirm\" placeholder=\"********\"/></br>-->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <input  type=\"submit\" name=\"save\" value=\"Register\">  \n");
      out.write("                </form> \n");
      out.write("            </div>\n");
      out.write("        </section>\n");
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
