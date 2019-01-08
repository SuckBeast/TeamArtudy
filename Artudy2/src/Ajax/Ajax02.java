package Ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.artInfo;
import com.control.galleryDAO;


@WebServlet("/Ajax02")
public class Ajax02 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*String[] tag=request.getParameterValues("ch_tag");*/
		String tag=request.getParameter("ch_tag");
		String[] sTag = tag.split(",");
		galleryDAO dao = new galleryDAO();
		ArrayList<artInfo> result = dao.tagSelect(sTag);
		System.out.println(result.get(0).getArt_name());
		if(result==null) {
			System.out.println("검색실패");
		}
		String buket="";
	
		for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i).getArt_name());
			buket+="{\"name\":\""+result.get(i).getArt_name()+"\",\"dir\":\""+result.get(i).getArt_dir()+"\"}";
			if(result.size()>1&&i!=result.size()-1) {
				buket+=",";
			}
		}
		
		String jsonA = "["+buket+"]";
		response.setContentType("application/json; charset=euc-kr");
		response.getWriter().print(jsonA);		
	}

}
