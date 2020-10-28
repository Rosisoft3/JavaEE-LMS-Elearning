package lms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lms.dao.DAOFactory;
import lms.dao.PlanningDAOImpl;

@WebServlet("/SupprimerPlanningServlet")
public class SupprimerPlanningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SupprimerPlanningServlet() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session =request.getSession();
		
			PlanningDAOImpl pdi=new PlanningDAOImpl(DAOFactory.getInstance());
			pdi.supprimerPlanning(id);
			session.setAttribute("typeAlert", "Success");
			RequestDispatcher rd = request.getRequestDispatcher("Planning");
			rd.forward(request, response);
		
	}

}