package unit;

import java.sql.SQLException;
import java.util.ArrayList;

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

	public ArrayList<Unit> getAllUnit(){
		ArrayList<Unit> unitList=new ArrayList<Unit>();
		try {
			unitList=unitDAO.getAllUnit();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return unitList;
	}

}
