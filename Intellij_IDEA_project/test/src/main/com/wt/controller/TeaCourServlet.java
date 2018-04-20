package wt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wt.dao.StuCourDAO;
import wt.dao.TeaCourDAO;

public class TeaCourServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if ("new".equalsIgnoreCase(action)) {
            doAdd(request, response);
        }
        if ("delete".equalsIgnoreCase(action)) {
            doDelete(request, response);
        }
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String tid = request.getParameter("tid");
        String cno = request.getParameter("cno");
        String scteachno = request.getParameter("cteachno");
        String clocation = request.getParameter("clocation");
        String ctime1 = request.getParameter("ctime1");
        String ctime2 = request.getParameter("ctime2");
        String scmax = request.getParameter("cmax");
        int cmax = Integer.parseInt(scmax);
        int cteachno = Integer.parseInt(scteachno);
        String ctime = ctime1 + "--" + ctime2 + "--";
        TeaCourDAO tcdao = new TeaCourDAO();
        try {
            tcdao.InsertCourse(tid, cno, cteachno, clocation, ctime, cmax);
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/t.png ><font size=6 color=red> 成功</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        } catch (Exception e) {
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red>  失败</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        }
        out.flush();
        out.close();
    }

    public void doDelete(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String tid = request.getParameter("tid");
        String rn = request.getParameter("n");
        int n = Integer.parseInt(rn);
        int fn = 0;
        int dn = 0;
        StuCourDAO scdao = new StuCourDAO();
        TeaCourDAO tcdao = new TeaCourDAO();
        for (int i = 0; i < n; i++) {
            String cno = request.getParameter("cno" + i + "");
            if (cno != null) {
                try {
                    tcdao.DeletebyID(tid, cno);
                    scdao.DeletebyTidCno(tid, cno);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    out.println("<HTML>");
                    out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
                    out.println("  <BODY bgcolor=#8dd8f8>");
                    out.print("  <img src=image/f.png ><font size=6 color=red>  " + cno + "<br></font> ");
                    out.println("  </BODY>");
                    out.println("</HTML>");
                    fn++;
                }
                dn++;
            }
        }
        if (dn == 0) {
            out.println("<HTML>");
            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
            out.println("  <BODY bgcolor=#8dd8f8>");
            out.print("  <img src=image/f.png ><font size=6 color=red> dn=0</font> ");
            out.println("  </BODY>");
            out.println("</HTML>");
        } else {
            if (fn == 0) {
                out.println("<HTML>");
                out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
                out.println("  <BODY bgcolor=#8dd8f8>");
                out.print("  <img src=image/t.png ><font size=6 color=red> fn=0</font> ");
                out.println("  </BODY>");
                out.println("</HTML>");
            }
        }
        out.flush();
        out.close();
    }


    public void init() throws ServletException {
    }

    public void destroy() {
        super.destroy();
    }

}
