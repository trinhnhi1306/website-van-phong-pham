package ptithcm.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Cart;
import ptithcm.entity.Feedback;
import ptithcm.entity.Product;
import ptithcm.entity.User;

@Repository
public class FeedbackDAO {
	
	@Autowired
	SessionFactory factory;
	
	public Feedback getFeedbackById(int userId, int productId) {
		Session session = factory.getCurrentSession();
		String hql = "from Feedback where user.id = :userId and product.id = :productId";
		Query query = session.createQuery(hql);

		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		Feedback list = (Feedback) query.list().get(0);
		return list;	
	}
	
	public int insertFeedback(Feedback feedback) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(feedback);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int updateFeedback(Feedback feedback) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(feedback);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int deleteFeedback(Feedback feedback) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(feedback);
			t.commit();
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

}
