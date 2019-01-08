package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QnADAO;
import model.QnAVO;

@WebServlet("/QnAcon")
public class QnAcon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int QnA_Number = Integer.parseInt(request.getParameter("QnA_Number"));
		String Title = request.getParameter("Title");
		String Text = request.getParameter("Text");
		
		QnADAO dao = new QnADAO();
		ArrayList<QnAVO> QnAList = dao.QnAALL();
		response.sendRedirect("QnA.jsp");
	}
}
