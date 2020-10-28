package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import lms.modele.Test;

public class TestDAOImpl implements ObjectDAOImpl{
	

	private DAOFactory daoFactory;
	private int id_test_auto=0;
	
	
	
	public int getId_test_auto() {
		return id_test_auto;
	}

	public void setId_test_auto(int id_test_auto) {
		this.id_test_auto = id_test_auto;
	}

	public TestDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	@Override
	public void insert(String sql, Object obj) throws DAOException {
		
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Test test = (Test)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,test.getId_module(), test.getNom(), test.getType());
			id_test_auto = preparedStatement.executeUpdate();
			if ( id_test_auto== 0 ) {
				throw new DAOException( "Echec de la creation du"
						+ "test, aucune ligne ajoutee dans la table." );
			}
			 valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	        id_test_auto = valeursAutoGenerees.getInt(1);
	        
	        
	        } else {
	            throw new DAOException( "Echec de la cr�ation du profil en base, aucun ID auto-genere retourne." );
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

	public void creerTest(Test test){
		String SQL_INSERT="INSERT INTO test (id_module, nom_test, type) VALUES(?, ?, ?)";
		insert(SQL_INSERT, test);
	}
	

}
