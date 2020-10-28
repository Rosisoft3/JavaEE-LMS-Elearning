package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Enseignant;



public class EnseignantDAOImpl implements ObjectDAOImpl {
	
	private DAOFactory daoFactory;
	
	public EnseignantDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Enseignant enseignant = (Enseignant)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true, enseignant.getId_profil(), enseignant.getId_module(), enseignant.getStatut());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "l'enseignant, aucune ligne ajoutée dans la table." );
			}valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            enseignant.setId_enseignant(valeursAutoGenerees.getInt(1));
	        
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
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Enseignant enseignant = (Enseignant)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false, enseignant.getStatut(), enseignant.getId_module(), enseignant.getId_enseignant());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "le profil, aucune ligne ajout�e dans la table." );
			}
		
			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}
		
	}

	@Override
	public void delete(String sql, Object obj) throws DAOException {
		
		
	}

	@Override
	public Enseignant select(String sql, Object... objs) throws DAOException {
		
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		Enseignant enseignant = new Enseignant();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				enseignant =(Enseignant) map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return enseignant;
	}
	
	
	private  Enseignant map( ResultSet resultSet ) throws
	SQLException {
		Enseignant enseignant =new Enseignant();
		
		enseignant.setId_enseignant(resultSet.getInt("id_enseignant"));
		enseignant.setId_profil(resultSet.getInt("id_profil"));
		enseignant.setId_module(resultSet.getInt("id_module"));
		enseignant.setStatut(resultSet.getString("statut"));
		return enseignant;
	}
	
	public Enseignant getEnseignant(int id_profil){
		String SQL_SELECT=
				"SELECT * FROM enseignant WHERE id_profil= ? ";
		return  select(SQL_SELECT,id_profil);
	}
	

	public void modifierStatut(Enseignant enseignant)
	{
		String SQL_UPDATE = "UPDATE enseignant SET statut= ?, id_module=? WHERE id_enseignant=?";
											
		
		update(SQL_UPDATE,enseignant);

	}

	public void ajouterEnseignant(Enseignant enseignant) {
		String SQL_INSERT="INSERT INTO enseignant (id_profil, id_module, statut) VALUES(?, ?, ?)";
		insert(SQL_INSERT, enseignant);
	}
	
}
