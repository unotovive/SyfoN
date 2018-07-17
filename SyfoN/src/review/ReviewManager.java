package review;

import java.sql.SQLException;
import java.util.ArrayList;


public class ReviewManager {

	private ArrayList<Review> reviewList;
	private Review review;
	private ReviewDAO reviewDAO;

	public ReviewManager(){
		reviewList = new ArrayList<Review>();
		review = new Review();
		reviewDAO =new ReviewDAO();
	}

	//仮。必要だったら作る
	public float averageTotalPoint() throws SQLException{
		return 0;
	}

	public ArrayList<Review> getReviewList(int lectureID) throws SQLException{
		reviewList = reviewDAO.getReviewList(lectureID);
		return reviewList;
	}

	public Review getReview(String reviewID) throws SQLException{
		review = reviewDAO.getReview(reviewID);
		return review;
	}

	public ArrayList<Review> getAllReviewID() throws SQLException{
		reviewList = reviewDAO.getAllReviewList();
		return reviewList;
	}

	public boolean registerReview(Review review) throws SQLException{
		boolean result = false;
		result = reviewDAO.registerReview(review);
		return result;
	}

	public boolean editReview(Review review) throws SQLException{
		boolean result = false;
		result = reviewDAO.updateReview(review);
		return result;
	}

	public boolean removeReview(Review review) throws SQLException{
		boolean result = false;
		result = reviewDAO.removeReview(review);
		return result;
	}

	public boolean check(Review review){
		boolean result=false;
		result=reviewDAO.check(review);
		return result;
	}

	public boolean removeReviewOfLecture(int lectureID) throws SQLException{
		boolean result=false;
		ArrayList<Review> reviewList=new ReviewManager().getReviewList(lectureID);
		for(Review tempReview:reviewList){
			result=reviewDAO.removeReview(tempReview);
			if(!result)break;
		}
		return result;
	}

}
