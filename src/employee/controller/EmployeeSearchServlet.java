package employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import employee.model.service.EmployeeService;
import employee.model.vo.Employee;
import student.model.vo.Student;

/**
 * Servlet implementation class EmployeeSearchServlet
 */
@WebServlet("/employeesearch")
public class EmployeeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    static int sort = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		EmployeeService eservice = new EmployeeService();

		Employee employee = new Employee();
		employee.setEmployeeNo(request.getParameter("searchno"));
		employee.setEmployeeName(request.getParameter("searchname"));
		employee.setEmpdepart_no(request.getParameter("searchdepart"));

		int listCount = eservice.getSearchCount(employee);
		if (listCount == 0) {
			response.setContentType("text/html; charset=utf-8");

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당하는 결과가 없습니다');");
			out.println("history.back();");
			out.println("</script>");
		}
		int maxPage = listCount / limit;
		if (listCount % limit > 0) {
			maxPage++;
		}
		int beginPage = 0;
		if (currentPage % limit == 0) {
			beginPage = currentPage - 9;
		} else {
			beginPage = (currentPage / limit) * limit + 1;
		}
		int endPage = beginPage + 9;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		if (request.getParameter("sort") != null) {
			sort = Integer.parseInt(request.getParameter("sort"));
		}
		ArrayList<Employee> list = eservice.searchEmployee(startRow, endRow, employee, sort);

		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/employeecrud/employeeSearch.jsp");
			request.setAttribute("list", list);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("beginPage", beginPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("searchno", request.getParameter("searchno"));
			request.setAttribute("searchname", request.getParameter("searchname"));
			request.setAttribute("searchdepart", request.getParameter("searchdepart"));
			view.forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
