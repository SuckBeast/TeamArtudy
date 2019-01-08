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
		  String saveDirectory01="imgSave";  /*���� ������ ������ ������ �̸�*/
	      
	      ServletContext context = getServletContext();/*������ ���� �ּҸ� �˼��ְ� �����ش�.*/
	      String saveDirectory =context.getRealPath("imgSave");
	      System.out.println(saveDirectory);
	      
	      int maxPostSize=1024*1024*5;/* ������ ���ε� ũ�⸦ �������ش�.*/
	      try {
	      MultipartRequest multi=new MultipartRequest(request, saveDirectory, maxPostSize, "euc-kr", new DefaultFileRenamePolicy());
	      /*4��°= ���� ���ε�� ���ڵ� �� ���???*/
	      /*new DefaultFileRenamePolicy()�� ���� Ŭ���̾�Ʈ�� ���� �̸��� ������ ����� �ߺ������� �Ͼ�Ƿ� ���ϸ��� �ڵ����� ��������ش�.*/
		
		String name = multi.getParameter("name");
		
		AdminDAO DAO = new AdminDAO();

		int cnt = DAO.product_delete(name);
		
		if(cnt>0) {
			System.out.println("����");
			PrintWriter out = response.getWriter();
			out.print("<script>history.go(-1)</script>");
			out.flush();
			out.close();
		}else {
			System.out.println("���� ����");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
