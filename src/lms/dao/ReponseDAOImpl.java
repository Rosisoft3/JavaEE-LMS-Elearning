package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Reponse;

public class ReponseDAOImpl implements ObjectDAOImpl {
	
	private DAOFactory daoFactory;
	
	public ReponseDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	@Override
	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Reponse reponse = (Reponse)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true, reponse.getId_test(), reponse.getId_question(), reponse.getContenu(), reponse.isValeur() );
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "la reponse, aucune ligne ajout�e dans la table." );
			}
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            reponse.setId_reponse(valeursAutoGenerees.getInt(1));
	        
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
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Reponse reponse = new Reponse();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				reponse =(Reponse) map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		
		return reponse;
	}

	private  Reponse map( ResultSet resultSet ) throws
	SQLException {
		
		Reponse reponse =new Reponse();
		reponse.setId_reponse(resultSet.getInt("id_reponse"));
		reponse.setId_test(resultSet.getInt("id_test"));
		reponse.setId_question(resultSet.getInt("id_question"));
		reponse.setContenu(resultSet.getString("contenu_rep"));
		reponse.setValeur(resultSet.getBoolean("valeur"));
		
		return reponse;
	}

	public void ajouterReponse(Reponse reponse){
		String SQL_INSERT = "INSERT INTO reponse(id_test, id_question, contenu_rep, valeur) VALUES(?, ?, ?, ?)";
		insert(SQL_INSERT, reponse);
	}
	
	public Reponse getReponse(String id_reponse){
		String SQL_SELECT="SELECT * FROM reponse WHERE id_reponse=?";
		return (Reponse)select(SQL_SELECT,id_reponse);
		
	}
	
}
