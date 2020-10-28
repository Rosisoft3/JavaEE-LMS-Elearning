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
import lms.dao.DocumentDAOImpl;



@WebServlet("/SupprimerDocServlet")
public class SupprimerDocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SupprimerDocServlet() {
        super();
     
    }

    
 @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	// TODO Auto-generated method stub
doPost(req, resp);
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		DocumentDAOImpl di=new DocumentDAOImpl(DAOFactory.getInstance());
		di.supprimerDoc(id);
		session.setAttribute("typeAlert", "Success");
		RequestDispatcher rd = request.getRequestDispatcher("ListeConfigDoc");
		rd.forward(request, response);
	}

}