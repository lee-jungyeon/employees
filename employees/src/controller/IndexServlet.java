
package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;


@WebServlet({"/","/index"})
public class IndexServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	private DepartmentsDao departmentsDao;
	private DeptManagerDao deptManagerDao;
	private DeptEmpDao deptEmpDao;
	private TitlesDao titlesDao;
	private SalariesDao salariesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("index URL 요청");
	//EmployeesDao employeesDao = new EmployeesDao
	//
	this.departmentsDao = new DepartmentsDao();
	int departmentsRowCount= departmentsDao.selectDepartmentsRowCount();

	this.deptManagerDao = new DeptManagerDao();
	int deptManagerRowCount= deptManagerDao.selectDeptManagerRowCount();

	this.deptEmpDao = new DeptEmpDao();
	int deptEmpRowCount= deptEmpDao.selectDeptEmpRowCount();

	this.titlesDao = new TitlesDao();
	int titlesRowCount= titlesDao.selectTitlesRowCount();

	this.salariesDao = new SalariesDao();
	int salariesRowCount= salariesDao.selectSalariesRowCount();
	
	this.employeesDao = new EmployeesDao();
	int employeesRowCount= employeesDao.selectEmployeesRowCount();
	int maxEmpNo=employeesDao.selectEmpNo("max");
	int minEmpNo=employeesDao.selectEmpNo("min");
	
	/*
	// /WEB-INF/views/index/jsp
	RequestDispatcher rd= request.getRequestDispatcher("/WEB-INF/views/index/jsp");
	rd.forward(request,response);//forward()媛�濡쒖븞�뿉�엳�뒗 媛� �쐞�엫
	*/
	request.setAttribute("max",maxEmpNo);
	request.setAttribute("min",minEmpNo);
	
	request.setAttribute("departmentsRowCount",departmentsRowCount);
	request.setAttribute("deptManagerRowCount",deptManagerRowCount);
	request.setAttribute("deptEmpRowCount",deptEmpRowCount);
	request.setAttribute("titlesRowCount",titlesRowCount);
	
	request.setAttribute("salariesRowCount",salariesRowCount);
	request.setAttribute("employeesRowCount",employeesRowCount);//integer 래퍼타입 오토박싱
	request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request,response);
	}
}
