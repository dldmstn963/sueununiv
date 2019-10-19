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

/**
 * Servlet implementation class EmployeeListServlet
 */
@WebServlet("/employeelist")
public class EmployeeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    static int sort = 0;

   	protected void doGet(HttpServletRequest request, HttpServletResponse response)
   			throws ServletException, IOException {
   		int currentPage = 1;
   		if (request.getParameter("page") != null) {
   			currentPage = Integer.parseInt(request.getParameter("page"));
   		}

   		int limit = 10;
   		EmployeeService eservice = new EmployeeService();

   		int listCount = eservice.getListCount();

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
   		ArrayList<Employee> list = eservice.selectList(startRow, endRow, sort);

   		RequestDispatcher view = null;
   		if (list.size() > 0) {
   			view = request.getRequestDispatcher("views/employeecrud/employeeUpdate.jsp");
   			request.setAttribute("list", list);
   			request.setAttribute("maxPage", maxPage);
   			request.setAttribute("currentPage", currentPage);
   			request.setAttribute("beginPage", beginPage);
   			request.setAttribute("endPage", endPage);
   			view.forward(request, response);
   		} else {
   			response.setContentType("text/html; charset=utf-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('직원 조회 실패');");
   			out.println("history.back();");
   			out.println("</script>");
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
