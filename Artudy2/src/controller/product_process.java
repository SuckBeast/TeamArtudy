package controller;

import java.io.IOException;

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



@WebServlet("/product_process")
public class product_process extends HttpServlet {



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String content = multi.getParameter("content");
		String tag = multi.getParameter("tag");
		String dir = multi.getFilesystemName("image");
		System.out.println(dir);
		
		
			adminVO VO = new adminVO(name, content, tag, dir);
			AdminDAO DAO = new AdminDAO();
			
			System.out.println(VO.getName());
			System.out.println(VO.getContent());
			System.out.println(VO.getTag());
			System.out.println(VO.getDir());
			
			
			
		int cnt = DAO.product_process(name, content, tag, dir);
		
		if(cnt>0) {
			request.setAttribute("imgVo", VO);
			RequestDispatcher dispatcher=request.getRequestDispatcher("Success.jsp?name="+name+"&content="+content+"&tag="+tag);
			dispatcher.forward(request, response);
			
			/*response.sendRedirect("Success.jsp?name="+name+"&content="+content+"&tag="+tag);*/
		}else {
			response.sendRedirect(""); 
		}
		
		
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}
}
