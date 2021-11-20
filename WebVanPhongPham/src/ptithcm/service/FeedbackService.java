package ptithcm.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.FeedbackDAO;
import ptithcm.entity.Feedback;
import ptithcm.entity.Product;
import ptithcm.entity.User;

@Service
@Transactional
public class FeedbackService {

	@Autowired
	FeedbackDAO feedbackDAO;
	
	public Feedback getFeedbackById(int userId, int productId) {
		Feedback feedback;
		try
		{
			feedback = feedbackDAO.getFeedbackById(userId, productId);
		}
		catch (Exception e) {
			System.out.println("Khach hang nay chua feedback san pham nay");
			e.printStackTrace();
			feedback = null;
		}
		return feedback;
	}
	
	public int addFeedback(Feedback feedback) {
		feedback.setDate(new java.util.Date());
		return feedbackDAO.insertFeedback(feedback);
	}
	
	public int editFeedback(Feedback feedback) {
		feedback.setDate(new java.util.Date());
		return feedbackDAO.updateFeedback(feedback);
	}
	
	public int deleteFeedback(Feedback feedback) {
		return feedbackDAO.deleteFeedback(feedback);
	}
}
