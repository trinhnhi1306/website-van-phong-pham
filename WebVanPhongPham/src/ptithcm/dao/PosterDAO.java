package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
