package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmployeesDao;
import vo.Employees;

@WebServlet("/emloyees/getEmployeesBetween")
public class GetEmployeesBetweenServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		if(session.getAttribute("sessionEmpNo")==null) {//처음 접속이거나 로그인을 하지않았거나...
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		employeesDao= new EmployeesDao();
	
	int begin= Integer.parseInt(request.getParameter("begin"));
	int end= Integer.parseInt(request.getParameter("end"));
	List<Employees> list =employeesDao.selectEmployeesBetween(begin, end);
	
	request.setAttribute("list", list);
	request.getRequestDispatcher("/WEB-INF/views/employees/employeesBetween.jsp").forward(request, response);
	}

}
