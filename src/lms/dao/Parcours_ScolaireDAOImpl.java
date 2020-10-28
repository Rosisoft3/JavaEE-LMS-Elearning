package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Niveau;


public class Parcours_ScolaireDAOImpl implements ObjectDAOImpl {

	private DAOFactory daoFactory;
	
	public Parcours_ScolaireDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	
	
	@Override
	public void insert(String sql, Object obj) throws DAOException {
		// TODO Auto-generated method stub
		
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
	public Niveau select(String sql, Object... objs) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Niveau niveau = new Niveau();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				niveau =map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return niveau;
	}

	
	private  Niveau map( ResultSet resultSet ) throws
	SQLException {
		Niveau niveau =new Niveau();
		niveau.setNiveau(resultSet.getString("niveau_scolaire"));
		return niveau;
	}
	
	public Niveau getNiveau_Scolaire(Object...objects){
		String SQL_SELECT=
				"select niveau_scolaire from parcours_scolaire where id_etudiant=? and id_annee_scolaire =?";
		return select(SQL_SELECT,objects);

	}
	
	
}