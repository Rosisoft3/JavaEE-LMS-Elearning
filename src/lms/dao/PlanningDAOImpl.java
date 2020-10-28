package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Planning;


public class PlanningDAOImpl implements ObjectDAOImpl {

	
	private DAOFactory daoFactory;
	
	public PlanningDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}
	
	
	@Override
	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Planning planning = (Planning)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,planning.getId_enseignant(),planning.getId_module(),planning.getHeure_debut(),planning.getHeure_fin(),planning.getDate(),planning.getDescription());
			 preparedStatement.executeUpdate();
			
		  

			
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
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		int id = (Integer)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,id);
			 preparedStatement.executeUpdate();
	
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}
		
	}

	@Override
	public Object select(String sql, Object... objs) throws DAOException {
		return null;
	}

	
	
	public void ajouterPlanning(Planning planning){
		String SQL_INSERT ="INSERT INTO planning (id_enseignant,id_module, heure_debut,heure_fin,date,description)"
				+ " VALUES (?, ?, ?,?,?,?)";
		insert(SQL_INSERT, planning);
	}
	
	public void supprimerPlanning(int id_planning){
		String SQL_DELETE ="DELETE FROM planning WHERE id_planning=?";
		
		delete(SQL_DELETE, id_planning);
		
	}
	
}