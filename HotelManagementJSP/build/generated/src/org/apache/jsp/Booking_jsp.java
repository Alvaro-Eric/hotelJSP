package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.AvailableStatus;
import Dao.GenericDao;
import java.util.List;
import Model.Room;
import Model.Customer;

public final class Booking_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Booking Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"BookingServlet\" method=\"POST\">\n");
      out.write("            <table border=\"0\">\n");
      out.write("                ");

                    GenericDao<Customer> csDao = new GenericDao<>(Customer.class);
                    GenericDao<Room> rmDao = new GenericDao<>(Room.class);
                    Customer cu = new Customer();
                    Room rm = new Room();
                    AvailableStatus types[]=AvailableStatus.values();
                    List<Customer> cus = (List<Customer>)csDao.findAll();
                    List<Room> rms = (List<Room>)rmDao.findAll();
                    
                
      out.write("\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("                    <tr><td>Customer ID</td>\n");
      out.write("                        <td>\n");
      out.write("                        <select name=\"customerid\">\n");
      out.write("                            ");
   
                            for (Customer c:cus){
                            
      out.write("\n");
      out.write("                             <option>");
      out.print(c.getCustomerid());
      out.write("</option>\n");
      out.write("                            ");
}
      out.write(" \n");
      out.write("                        </select>   \n");
      out.write("                        </td>    \n");
      out.write("                    </tr>\n");
      out.write("                    <tr><td>Room ID</td>\n");
      out.write("                        <td>\n");
      out.write("                        <select name=\"roomid\">\n");
      out.write("                            ");
   
                            for (Room r:rms){
                            
      out.write("\n");
      out.write("                            <option>");
      out.print(r.getRoomid());
      out.write("</option>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </select>   \n");
      out.write("                        </td>    \n");
      out.write("                    </tr>\n");
      out.write("                    <tr><td>Starting Date</td><td><input type=\"date\" name=\"sdate\" value=\"\"/></td></tr>\n");
      out.write("                    <tr><td>Ending Date</td><td><input type=\"date\" name=\"edate\" value=\"\"/></td></tr>\n");
      out.write("                    <tr><td>Change Room Status</td>\n");
      out.write("                        <td>\n");
      out.write("                        <select name=\"rmStatus\">\n");
      out.write("                            ");
   
                            for (AvailableStatus tt:types){
                            
      out.write("\n");
      out.write("                            <option>");
      out.print(tt.toString());
      out.write("</option>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </select>   \n");
      out.write("                        </td>    \n");
      out.write("                    </tr>\n");
      out.write("                    <tr><td><input type=\"submit\" value=\"SAVE\" name=\"submit\"/></td></tr> \n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <table  border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>S/N</th>\n");
      out.write("                    <th>Customer ID</th>\n");
      out.write("                    <th>Room ID</th>\n");
      out.write("                    <th>Starting Date</th>\n");
      out.write("                    <th>Ending Date</th>\n");
      out.write("                    <th>PayPerDay</th>\n");
      out.write("                    <th>TotPay</th>\n");
      out.write("                </tr>    \n");
      out.write("                </thead>\n");
      out.write("                \n");
      out.write("               \n");
      out.write("            </table>        \n");
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
