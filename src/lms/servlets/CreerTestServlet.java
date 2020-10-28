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
import lms.dao.QuestionDAOImpl;
import lms.dao.ReponseDAOImpl;
import lms.dao.TestDAOImpl;
import lms.modele.Enseignant;
import lms.modele.Question;
import lms.modele.Reponse;
import lms.modele.Test;

@WebServlet("/CreerTestServlet")
public class CreerTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreerTestServlet() {
        super();
    	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Enseignant enseignant = (Enseignant) session.getAttribute("enseignant");
		
		String nom= request.getParameter("nom");
		String type = request.getParameter("type");
		int id_module = enseignant.getId_module();
		System.out.println(nom);
		System.out.println("   "+type);
		System.out.println("\n id module "+id_module);
		
		Test test = new Test();
		test.setNom(nom);
		test.setType(type);
		test.setId_module(id_module);
		System.out.println("\n test : "+test.getNom());
		
		TestDAOImpl tdi = new TestDAOImpl(DAOFactory.getInstance());
		tdi.creerTest(test);
		
		int id_test = tdi.getId_test_auto();
		System.out.println("\n id test : "+id_test);
		
		
		//Boucle QUESTION !!!!!!
		
		for(int i=1; i<5; i++){
			String contenu = request.getParameter("quest-"+i);
			double notation = 2.5;
			
			Question question = new Question();
			question.setContenu(contenu);
			question.setNotation(notation);
			question.setId_test(id_test);
			
			System.out.println("\n question : "+question.getContenu());
			
			QuestionDAOImpl qdi = new QuestionDAOImpl(DAOFactory.getInstance());
			qdi.ajouterQuestion(question);
			int id_question = qdi.getId_question_auto();
			
			
			System.out.println("\n"+id_question);
			
			String rep_checked = request.getParameter("valeur_rep-"+i);
			int rep_int = Integer.parseInt(rep_checked);
			System.out.println("rep checked = "+rep_checked);
			
			
			// BOUCLE REPONSE !!!!!
			
			for(int j=1; j<4; j++){
				
				String rep_contenu = request.getParameter(i+"-rep-"+j);
				
				
				boolean rep_valeur=false;	
				Reponse reponse = new Reponse();
				reponse.setId_question(id_question);
				reponse.setId_test(id_test);
				reponse.setContenu(rep_contenu);
				
				
				if(rep_int==j){
					rep_valeur=true;	
					}
				reponse.setValeur(rep_valeur);
				System.out.println("contenu : "+rep_contenu +" valeur reponse : "+ reponse.isValeur() +"\n");
				
				ReponseDAOImpl rdi = new ReponseDAOImpl(DAOFactory.getInstance());
				rdi.ajouterReponse(reponse);
				
			}
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/CreerTest");
		rd.forward(request, response);
				
	}

}
