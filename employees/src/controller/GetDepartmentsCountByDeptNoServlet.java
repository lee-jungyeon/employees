package controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DepartmentsDao;

@WebServlet("/departments/getDepartmentsCountByDeptNo")
public class GetDepartmentsCountByDeptNoServlet extends HttpServlet {
	
	private DepartmentsDao departmentsDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		if(session.getAttribute("sessionEmpNo")==null) {//처음 접속이거나 로그인을 하지않았거나...
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		departmentsDao = new DepartmentsDao();
	
	List<Map<String , Object>>list=departmentsDao.selectDepartmentsCountByDeptNo();
	
	request.setAttribute("list", list);
	request.getRequestDispatcher("/WEB-INF/views/departments/departmentsCountByDeptNo.jsp").forward(request, response);
	}

}
