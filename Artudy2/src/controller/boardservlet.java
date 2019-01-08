package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.VO;

/**
 * Servlet implementation class boardservlet
 */
@WebServlet("/boardservlet")
public class boardservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("EUC-KR");
        
        String id=request.getParameter("id");
        String pw = request.getParameter("pw");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        
        VO vo=new VO(title,id,content,pw);
        
        DAO dao=new DAO();
        
        int cnt=dao.insert(vo);
        
        if (cnt > 0) {
           response.sendRedirect("boardList.jsp");
        }
     
     
  }

}
