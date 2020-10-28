package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Question;

public class QuestionDAOImpl implements ObjectDAOImpl{
	
private DAOFactory daoFactory;
private int id_question_auto;
	
	public QuestionDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}
	

	public int getId_question_auto() {
		return id_question_auto;
	}

	@Override
	public void insert(String sql, Object obj) throws DAOException {
		

		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Question question = (Question)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true, question.getId_test(), question.getContenu(), question.getNotation());
			int	statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la creation du"
						+ "question, aucune ligne ajoutee dans la table." );
			}
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            id_question_auto = valeursAutoGenerees.getInt(1);
	            System.out.println("l'id du question : "+valeursAutoGenerees.getInt(1));
	        
	        } else {
	            throw new DAOException( "Echec de la cr�ation du question en base, aucun ID auto-genere retourne." );
	        }

			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}
		
	}

	@Override
	public void update(String sql, Object obj) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String sql, Object obj) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object select(String sql, Object... objs) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void ajouterQuestion(Question question){
		String SQL_INSERT="INSERT INTO question (id_test, contenu_question, notation) VALUES (?, ?, ?) ";
		insert(SQL_INSERT, question);
	}

}
