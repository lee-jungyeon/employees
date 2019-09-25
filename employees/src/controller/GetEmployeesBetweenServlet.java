package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeesDao;
import vo.Employees;

@WebServlet("/emloyees/getEmployeesBetween")
public class GetEmployeesBetweenServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	employeesDao= new EmployeesDao();
	
	int begin= Integer.parseInt(request.getParameter("begin"));
	int end= Integer.parseInt(request.getParameter("end"));
	List<Employees> list =employeesDao.selectEmployeesBetween(begin, end);
	
	request.setAttribute("list", list);
	request.getRequestDispatcher("/WEB-INF/views/employees/employeesBetween.jsp").forward(request, response);
	}

}
