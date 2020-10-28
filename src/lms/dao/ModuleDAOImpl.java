package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Module;


public class ModuleDAOImpl implements ObjectDAOImpl{

	private DAOFactory daoFactory;
	
	public ModuleDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}
	
	
	@Override
	public void insert(String sql, Object obj) throws DAOException {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Module module = (Module)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,module.getNom(), module.getCoefficient(), module.getDescription(), module.getNiveau());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la creation du"
						+ "module, aucune ligne ajoutee dans la table." );
			}
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            module.setId_module((valeursAutoGenerees.getInt(1)));
	        
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

		
	}

	@Override
	public void delete(String sql, Object obj) throws DAOException {

		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		String nom = (String)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false, nom);
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la suppression du"
						+ " module, aucune ligne ajoutee dans la table." );
			}
			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}

	}

	@Override
	public Module select(String sql, Object... objs) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Module	 module = new Module();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				module =(Module) map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return module;
	}
	
	
	
	private  Module map( ResultSet resultSet ) throws
	SQLException {
		Module module =new Module();
		module.setNom(resultSet.getString("nom_module"));
		module.setId_module(resultSet.getInt("id_module"));
		module.setCoefficient(resultSet.getInt("coefficient"));
		module.setDescription(resultSet.getString("description"));
		module.setNiveau(resultSet.getInt("niveau"));
		return module;
	}

	
	public Module getModule(Object...objects){
		String SQL_SELECT=
				"SELECT * FROM module WHERE id_module=?";
		return select(SQL_SELECT,objects);

	}
	
	public void creerModule(Module module){
		String SQL_INSERT="INSERT INTO module (nom_module, coefficient, description, niveau) VALUES(?, ?, ?, ?)";
		insert(SQL_INSERT, module);
	}
	
	public void supprimerModule(String nom){
		
			String SQL_DELETE="DELETE FROM module WHERE nom_module=?";
			delete(SQL_DELETE, nom);
	
		
	}
	
}
