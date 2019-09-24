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


@WebServlet("/employees/getEmployeesList")
public class GetEmployeesListServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int limit=10;
		if(request.getParameter("limit")!=null) {
			limit=Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("limit 확인: "+limit);
		
		//객체 생성을 한다
		employeesDao = new EmployeesDao();
		// employees list 리턴 값 limit 저장
		List<Employees>list= employeesDao.selectEmployeesListByLimit(limit);
		// view로 넘길  request에 list를 저장한다.
		request.setAttribute("list", list);
		// view로 forward할 주소를 입력후 forward한다.
		request.getRequestDispatcher("/WEB-INF/views/employeesList.jsp").forward(request,  response);
	}
}
