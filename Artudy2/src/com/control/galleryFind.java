package com.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/galleryFind")
public class galleryFind extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] tag = request.getParameterValues("ch_tag");
		galleryDAO dao = new galleryDAO();
		ArrayList<artInfo> result = dao.tagSelect(tag);
		
		if(result==null) {
			//검색에 실패했을때
		}
		for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i).getArt_name());
			System.out.println(result.get(i).getArt_dir());
		}
		/*HttpSession session=request.getSession();
		session.setAttribute("email", email);
		//main.jsp로 이동
		response.sendRedirect("main.jsp");*/
	}
}
