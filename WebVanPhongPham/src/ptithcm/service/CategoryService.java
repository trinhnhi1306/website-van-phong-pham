package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.CategoryDAO;
import ptithcm.entity.Category;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryDAO categoryDAO;
	
	public List<Category> getAllCategories() {
		
		return categoryDAO.getAllCategories();
	}
	
	public Category getCategory(String name) {
		
		return categoryDAO.getCategory(name);
	}
	
	public List<Category> searchCategories(String name) {
		
		return categoryDAO.searchCategories(name);
	}
	
}
