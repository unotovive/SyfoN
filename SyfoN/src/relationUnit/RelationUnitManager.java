package relationUnit;

import java.sql.SQLException;

public class RelationUnitManager {
	private RelationUnit relationUnit;
	private RelationUnitDAO relationUnitDAO;

	public RelationUnitManager(){
		relationUnit = new RelationUnit();
		relationUnitDAO = new RelationUnitDAO();
	}

	public RelationUnit getRelationUnit(int lectureID) throws SQLException{
		relationUnit = relationUnitDAO.getRelationUnit(lectureID);
		return relationUnit;
	}

	public Boolean registerRelationUnit(RelationUnit relationUnit) throws SQLException{
		boolean result = false;
		result = relationUnitDAO.registerRelationUnit(relationUnit);
		return result;
	}

	public Boolean editRelationUnit(RelationUnit relationUnit) throws SQLException{
		boolean result = false;
		result = relationUnitDAO.updateRelationUnit(relationUnit);
		return result;
	}

	public Boolean removeRelationUnit(RelationUnit relationUnit) throws SQLException{
		boolean result = false;
		result = relationUnitDAO.removeRelationUnit(relationUnit);
		return result;
	}

}
