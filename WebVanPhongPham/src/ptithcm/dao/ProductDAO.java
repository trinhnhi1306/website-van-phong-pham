package ptithcm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Product;

@Repository
public class ProductDAO {
	
	@Autowired
	SessionFactory factory;
	
	public List<Product> getAllProducts() {
		Session session = factory.getCurrentSession();
		String hql = "from Product";
		Query query = session.createQuery(hql);

		List<Product> list = query.list();
		return list;
	}
	
	public Product getProductByID(int id) {
		Session session = factory.getCurrentSession();
		String hql = "from Product where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Product list = (Product) query.list().get(0);
		return list;
	}

}
