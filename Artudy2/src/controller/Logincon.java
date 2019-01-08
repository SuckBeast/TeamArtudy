package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.MemberDAO;

@WebServlet("/Logincon")
public class Logincon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String ADMIN_PW = request.getParameter("ADMIN_PW");
		MemberDAO dao = new MemberDAO();

		boolean isCheck = dao.loginCheck(ADMIN_PW);
		if (isCheck) {
			HttpSession session = request.getSession();
			session.setAttribute("ADMIN_PW", ADMIN_PW);
			response.sendRedirect("WebContent/Admin_Login.jsp");
		}else {
			System.out.println("안넘어 가노 시팔");
		}
	}
}
