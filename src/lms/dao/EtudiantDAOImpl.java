package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Etudiant;

public class EtudiantDAOImpl implements ObjectDAOImpl{


	private DAOFactory daoFactory;
	
	public EtudiantDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}
	
	@Override
	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Etudiant etudiant = (Etudiant)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true, etudiant.getId_profil(), etudiant.getAnnee_entree());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "l'etudiant, aucune ligne ajoutée dans la table." );
			}valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            etudiant.setId_etudiant(valeursAutoGenerees.getInt(1));
	        
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
		
		Etudiant etudiant = new Etudiant();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				etudiant =(Etudiant) map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return etudiant;
	}

	private  Etudiant map( ResultSet resultSet ) throws
	SQLException {
		Etudiant etudiant=new Etudiant();
		
		etudiant.setId_etudiant(resultSet.getInt("id_etudiant"));
		etudiant.setId_profil(resultSet.getInt("id_profil"));
		etudiant.setAnnee_entree(resultSet.getInt("annee_entree"));
		return etudiant;
	}

	public Etudiant getEtudiant(int id_profil){
		String SQL_SELECT=
				"SELECT * FROM etudiant WHERE id_profil= ? ";
		return  (Etudiant) select(SQL_SELECT,id_profil);
	}

	public void ajouterEtudiant(Etudiant etudiant) {
		String SQL_INSERT="INSERT INTO etudiant (id_profil, annee_entree) VALUES(?,?)";
		insert(SQL_INSERT, etudiant);
	}
	
	
}
