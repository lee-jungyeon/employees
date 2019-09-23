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


@WebServlet("/employees/getEmployeesListOrderBy")
public class GetEmployeesListOrderByServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String order=request.getParameter("order");//order 값을 저장한다.
	System.out.println("order 값:"+order);//order값이 들어 왔는지 확인한다.
	// model 객체 생성
	employeesDao= new EmployeesDao();
	// employees list 리턴 값 order 저장
	List<Employees>list= employeesDao.selectEmployeesListOrderBy(order);
	// view로 넘길  request에 list를 저장한다.
	request.setAttribute("list", list);
	// view로 forward할 주소를 입력후 forward한다.
	request.getRequestDispatcher("/WEB-INF/views/employeesOrderByList.jsp").forward(request, response);
	
	
	
	}

}
