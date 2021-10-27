package ptithcm.service;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.dao.CategoryDAO;
import ptithcm.entity.Category;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ServletContext context;
	
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
	
	public List<Category> searchCategories(String name) {
		
		return categoryDAO.searchCategories(name);
	}
	
	@Autowired
	ImageService imageService;
	
	public int addCategory(HttpServletRequest request, Category category, MultipartFile file) {
		
		if(file.isEmpty())
			category.setImage("defaul.png");
		else {
			String uploadPath = request.getServletContext().getRealPath("resources/images/categories");
			String imageName = imageService.uploadFile(uploadPath, file);
			category.setImage(imageName);
		}
		
		return categoryDAO.insertCategory(category);
	}
	
	public int editCategory(HttpServletRequest request, Category category, MultipartFile file) {
		
		if(!file.isEmpty()) {			
			String uploadPath = request.getServletContext().getRealPath("resources/images/categories");
			String imageName = imageService.uploadFile(uploadPath, file);
			category.setImage(imageName);
		}
		else
			category.setImage(category.getImage());
		
		return categoryDAO.updateCategory(category);
	}
	
	public int deleteCategory(Category category) {
		return categoryDAO.deleteCategory(category);
	}
	
}
