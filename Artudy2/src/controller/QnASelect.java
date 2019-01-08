package controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QnADAO;
import model.QnAVO;

@WebServlet("/QnASelect")
public class QnASelect extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Select = request.getParameter("Search");
		QnADAO dao = new QnADAO();
		ArrayList<QnAVO> Arr  = dao.QnAALL(Select);
		request.setAttribute("Arr", Arr);
		RequestDispatcher dis = request.getRequestDispatcher("QnASelect.jsp");
		dis.forward(request, response);
	}
}