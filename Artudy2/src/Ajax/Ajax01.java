package Ajax;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.DAO;


@WebServlet("/Ajax01")
public class Ajax01 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String text=request.getParameter("reply");
		String name= request.getParameter("name");
		String name2 = URLDecoder.decode(name, "UTF-8");
		
		DAO dao = new DAO();
	
		int result = dao.textInsert(text,name2);
		
		if(result==0) {
			System.out.println("검색실패");
		}
	}

}
