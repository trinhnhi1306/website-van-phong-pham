package ptithcm.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptithcm.entity.Permission;

@Repository
public class PermissionDAO {

	@Autowired
	SessionFactory factory;
	
	public Permission getPermissionByID(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "from Permission";
		Query query = session.createQuery(hql);

		Permission list = (Permission) query.list().get(0);
		return list;
	}
	
}
