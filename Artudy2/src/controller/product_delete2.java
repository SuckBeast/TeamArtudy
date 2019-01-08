package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.AdminDAO;
import model.adminVO;


@WebServlet("/product_delete2")
public class product_delete2 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		 request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; chatset=UTF-8");
		  String saveDirectory01="imgSave";  /*내가 실제로 저장할 폴더의 이름*/
	      
	      ServletContext context = getServletContext();/*서버상 실제 주소를 알수있게 도와준다.*/
	      String saveDirectory =context.getRealPath("imgSave");
	      System.out.println(saveDirectory);
	      
	      int maxPostSize=1024*1024*5;/* 파일의 업로드 크기를 지정해준다.*/
	      try {
	      MultipartRequest multi=new MultipartRequest(request, saveDirectory, maxPostSize, "euc-kr", new DefaultFileRenamePolicy());
	      /*4번째= 파일 업로드시 인코딩 할 언어???*/
	      /*new DefaultFileRenamePolicy()는 여러 클라이언트가 같은 이름의 파일을 저장시 중복현상이 일어나므로 파일명을 자동으로 변경시켜준다.*/
		
		String name = multi.getParameter("name");
		
		AdminDAO DAO = new AdminDAO();

		int cnt = DAO.product_delete(name);
		
		if(cnt>0) {
			System.out.println("삭제");
			PrintWriter out = response.getWriter();
			out.print("<script>history.go(-1)</script>");
			out.flush();
			out.close();
		}else {
			System.out.println("삭제 실패");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
