package ptithcm.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.UploadFile;
import ptithcm.dao.CategoryDAO;
import ptithcm.entity.Category;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryDAO categoryDAO;
	
	public PagedListHolder paging(List<Category> list, HttpServletRequest request) {
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);
		return pagedListHolder;
	}
	
	public List<Category> getAllCategories() {
		
		return categoryDAO.getAllCategories();
	}
	
	public Category getCategoryByID(int id) {
		
		return categoryDAO.getCategoryByID(id);
	}
	
	public Category getCategoryByName(String name) {
		Category category;
		try
		{
			category = categoryDAO.getCategoryByName(name);
		}
		catch (Exception e) {
			category = null;
		}
		return category;
	}
	
	public List<Category> searchCategories(String name) {
		
		return categoryDAO.searchCategories(name);
	}
	
	@Autowired
	@Qualifier("uploadfile")
	UploadFile uploadFile;
	
	public int addCategory(Category category, MultipartFile file) {
		
		if(file.isEmpty())
			category.setImage("defaul.png");
		else {			
			try {	
				String fileName = uploadFile.setFileName(file);
				
	            String filePath = uploadFile.getBasePath() + "/categories" + File.separator + fileName;
	            System.out.println(filePath);
	            file.transferTo(new File(filePath));
	            
				category.setImage(fileName);
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
				return 2;		
			}
		}
		
		return categoryDAO.insertCategory(category);
	}
	
	public int editCategory(Category category, MultipartFile file) {
		
		if(!file.isEmpty()) {			
			try {	
				String fileName = uploadFile.setFileName(file);
				
	            String filePath = uploadFile.getBasePath() + "/categories" + File.separator + fileName;
	            System.out.println(filePath);
	            file.transferTo(new File(filePath));
	            
				category.setImage(fileName);
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
				return 2;		
			}
		}
		else
			category.setImage(category.getImage());
		
		return categoryDAO.updateCategory(category);
	}
	
	public int deleteCategory(Category category) {
		return categoryDAO.deleteCategory(category);
	}
	
}
