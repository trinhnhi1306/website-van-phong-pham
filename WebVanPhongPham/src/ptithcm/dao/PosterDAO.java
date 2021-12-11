package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Category;
import ptithcm.entity.Poster;

@Repository
public class PosterDAO {

	@Autowired
	SessionFactory factory;
	
	public List<Poster> getAllPosters() {
		Session session = factory.getCurrentSession();
		String hql = "from Poster";
		Query query = session.createQuery(hql);

		List<Poster> list = query.list();
		return list;
	}
	
	public List<Poster> getActivedLeftPosters() {
		Session session = factory.getCurrentSession();
		String hql = "from Poster where type = 1 and isActive = true";
		Query query = session.createQuery(hql);

		List<Poster> list = query.list();
		return list;
	}
	
	public List<Poster> getActivedRightPosters() {
		Session session = factory.getCurrentSession();
		String hql = "from Poster where type = 2 and isActive = true";
		Query query = session.createQuery(hql);

		List<Poster> list = query.list();
		return list;
	}
	
	public Poster getPosterByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from Poster where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Poster poster = (Poster) query.list().get(0);
		return poster;
	}
	
	public int insertPoster(Poster poster) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(poster);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public int undisplayPoster(Poster poster) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(poster);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
}
