package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.webgoat.util.HtmlEncoder;


/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String ten_san_pham= request.getParameter("ten_san_pham");
		String ten_the_loai= request.getParameter("ten_the_loai");
		
		ten_san_pham = HtmlEncoder.encode(ten_san_pham);
		ten_the_loai = HtmlEncoder.encode(ten_the_loai);	
		
		String err="";
		
		if(ten_san_pham.equals("") && ten_the_loai.equals("")){
			err+="Phải nhập ít nhất một thông tin tìm kiếm";
		}
		if(!Util.checkStringParam(ten_san_pham) || !Util.checkStringParam(ten_the_loai) || ten_san_pham.length()<200 || ten_the_loai.length()<200){
			err+="Tên sản phẩm hoặc tên thể loại không đúng";
		}
		if (err.length() > 0) {
			request.setAttribute("err", err);
		}
		
		String url = "/search_page.jsp";
		try {
			
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/login.jsp");
		}
	}

}