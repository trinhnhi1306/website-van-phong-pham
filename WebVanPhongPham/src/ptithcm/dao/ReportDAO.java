package ptithcm.dao;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {

	@Autowired
	SessionFactory factory;
	
	public long countOrderByStatus(int statusId)
	{
		Session session = factory.getCurrentSession();
		String hql = "select count(*) FROM Order WHERE status.id = :statusId";
		Query query = session.createQuery(hql);
		query.setParameter("statusId", statusId);	
		try
		{
			long list = (long) query.list().get(0);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}		
	}
	
	public long countItemByDate(Date date)
	{
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(*) FROM Order WHERE date = :date";
		Query query = session.createQuery(hql);
		query.setDate("date", date);
		try
		{
			long list = (long) query.list().get(0);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}		
	}
	
	public long countUserByDate(Date date)
	{
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(*) FROM User WHERE registrationDate = :date and permission.id = 1";
		Query query = session.createQuery(hql);
		query.setDate("date", date);
		try
		{
			long list = (long) query.list().get(0);
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}		
	}
}
