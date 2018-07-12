package MustTani;

public class MustTaniManager {
	MustTaniDAO mustTaniDAO=new MustTaniDAO();
	public  MustTani getMustTani(){
		MustTani mt=new MustTani();
		mt=mustTaniDAO.getMustTani();
		return mt;
	}
}
