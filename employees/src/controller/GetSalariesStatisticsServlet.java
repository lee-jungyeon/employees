package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SalariesDao;


@WebServlet("/salaries/getSalariesStatistics")
public class GetSalariesStatisticsServlet extends HttpServlet {
	private SalariesDao salariesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		if(session.getAttribute("sessionEmpNo")==null) {//처음 접속이거나 로그인을 하지않았거나...
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		salariesDao = new SalariesDao();
	Map<String,Long>map =salariesDao.selectSalariesStatistics();
	request.setAttribute("map", map);
	request.getRequestDispatcher("/WEB-INF/views/salaries/salariesStatistics.jsp").forward(request,response);
	
	}

}
