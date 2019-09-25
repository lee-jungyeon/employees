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


@WebServlet("/employees/getEmployeesListByPage")
public class GetEmployeesListByPageServlet extends HttpServlet {
		private EmployeesDao employeesDao;
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		employeesDao = new EmployeesDao();
		//페이징 변수 선언
		int rowPerPage = 10;
		int currentPage = 1;
		//currentPage가 null값이 아니면 currentPage값을 가져온다.
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		//cuurentPage값 확인
		//System.out.println("cuurentPage  : " + currentPage);	
		int lastPage = employeesDao.selectLastPage(rowPerPage);
		//System.out.println("lastPage : " + lastPage);	

		List<Employees> list = employeesDao.selectEmployeesListByPage(currentPage, rowPerPage);
				
		request.setAttribute("list", list);							
		request.setAttribute("currentPage", currentPage);			
		request.setAttribute("lastPage", lastPage);					

		request.getRequestDispatcher("/WEB-INF/views/employees/employeesListByPage.jsp").forward(request, response);
	}
}