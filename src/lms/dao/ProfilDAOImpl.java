package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Profil;

public class ProfilDAOImpl implements ObjectDAOImpl {

	private DAOFactory daoFactory;
	
	public ProfilDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	@Override
	public Profil select(String sql,Object... objs) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Profil profil = new Profil();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				profil =(Profil) map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return profil;
	}



	@Override
	public void insert(String sql,Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Profil profil = (Profil)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,profil.getType(), profil.getLogin(),profil.getMp(),profil.getNom(),profil.getPrenom(),profil.getAdresse(),profil.getE_mail(),profil.getDate_naissance(),profil.getLieu_maissance(),profil.getSexe(),profil.getTelephone(),profil.getPhoto());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "le profil, aucune ligne ajout�e dans la table." );
			}
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            profil.setId(valeursAutoGenerees.getInt(1));
	        
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
		Profil profil = (Profil)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false,profil.getLogin(),profil.getMp(),profil.getAdresse(),profil.getE_mail(),profil.getPhoto());
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

	public void update2(String sql, Object obj){
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Profil profil = (Profil)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false, profil.getLogin(),profil.getMp(),profil.getNom(), profil.getPrenom(),
					profil.getAdresse(),profil.getE_mail(), profil.getDate_naissance(), profil.getLieu_maissance(), profil.getSexe(), profil.getTelephone());
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
		
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		String id = (String)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false, id);
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la suppression du"
						+ " profil, aucune ligne ajoutee dans la table." );
			}
			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}

		
	}
	
	
	private  Profil map( ResultSet resultSet ) throws
	SQLException {
		
		Profil profil =new Profil();
		profil.setId(resultSet.getInt("id_profil"));
		profil.setPhoto(resultSet.getString("photo"));
		profil.setLogin(resultSet.getString("login"));
		profil.setE_mail(resultSet.getString("e_mail"));
		profil.setMp(resultSet.getString("mp"));
		profil.setPrenom(resultSet.getString("prenom"));
		profil.setNom(resultSet.getString("nom"));
		profil.setDate_naissance(resultSet.getDate("date_de_naissance"));
		profil.setSexe(resultSet.getString("sexe"));
		profil.setAdresse(resultSet.getString("adresse"));
		profil.setLieu_maissance(resultSet.getString("lieu_de_naissance"));
		profil.setTelephone(resultSet.getString("telephone"));
		profil.setType(resultSet.getString("type"));
		return profil;
	}
	
	public void modifierSonProfil(Profil profil)
	{
		String SQL_UPDATE = "UPDATE profil SET login = ?"
											+ "	, mp = ?"
											+ ", adresse= ?"
										     +", e_mail= ?"
											+",photo=?"
										     + "WHERE id_profil ='"+profil.getId()+"'";
		
		update(SQL_UPDATE,profil);
	}

	public Profil seConnecter(Object...objects){
		String SQL_SELECT=
				"SELECT * FROM profil WHERE login=? and mp=?";
		return(Profil)select(SQL_SELECT,objects);
}
	
	public void ajouterProfil(Profil profil){
		String SQL_INSERT ="INSERT INTO profil (type, login, mp, nom, prenom, adresse, e_mail, date_de_naissance"
				+ ", lieu_de_naissance, sexe, telephone,photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
		insert(SQL_INSERT, profil);
	}
	
	public void supprimerProfil(String id){
		String SQL_DELETE ="DELETE FROM profil WHERE id_profil=? ";
		delete(SQL_DELETE,id);
	}

	public void modifierUnProfil(Profil profil) {
		String SQL_UPDATE="UPDATE profil SET login=?, mp=?, nom=?, prenom=?, adresse=?, e_mail=?, date_de_naissance=?, lieu_de_naissance=?, sexe=?, "
				+ "  telephone=? WHERE id_profil="+profil.getId();
		update2(SQL_UPDATE, profil);
	}
}