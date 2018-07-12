package unit;

import java.sql.SQLException;

public class UnitManager {

	private Unit unit;
	private UnitDAO unitDAO;

	public UnitManager(){
		unit = new Unit();
		unitDAO = new UnitDAO();
	}

	public Unit getUnit(String unitID) throws SQLException{
		unit = unitDAO.getUnit(unitID);
		return unit;
	}

}
