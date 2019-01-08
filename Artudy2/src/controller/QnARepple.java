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

@WebServlet("/QnARepple")
public class QnARepple extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		QnADAO dao = new QnADAO();
		int QnA_Number = Integer.parseInt(request.getParameter("QnA_Number"));
		String Rip = request.getParameter("Rip");
		dao.QnARepple(Rip, QnA_Number);
		response.sendRedirect("QnA.jsp");
	}
}
