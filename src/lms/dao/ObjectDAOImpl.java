package lms.dao;



public interface ObjectDAOImpl {
	
			

	
	  void insert(String sql,Object obj) throws DAOException ;
	  void update(String sql,Object obj) throws DAOException ;
	  void delete(String sql,Object obj) throws DAOException ;
	
	  Object select(String sql ,Object... objs) throws DAOException;


	
	

}
