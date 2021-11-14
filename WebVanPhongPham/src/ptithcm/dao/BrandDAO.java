package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Brand;

@Repository
public class BrandDAO {
	@Autowired
	SessionFactory factory;
	
	public List<Brand> getAllBrands() {
		Session session = factory.getCurrentSession();
		String hql = "from Brand";
		Query query = session.createQuery(hql);
		List<Brand> list = query.list();
		return list;
	}
}
