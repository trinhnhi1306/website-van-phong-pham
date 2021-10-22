package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Category;
import ptithcm.service.CategoryService;

@Controller
@RequestMapping("/admin")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/category")
	public String index(HttpServletRequest request, ModelMap model) {

		List<Category> list = categoryService.getAllCategories();
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);

		model.addAttribute("pagedListHolder", pagedListHolder);
		return "category";
	}
	
	@RequestMapping(value="/category", params = "btnSearch")
	public String search (HttpServletRequest request, ModelMap model) {
		
		String name = request.getParameter("searchInput");
		
		
		List<Category> list = categoryService.searchCategories(name);
		
		//bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(8);		
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "category";
	}

	@RequestMapping("/category/add")
	public String add (HttpServletRequest request, ModelMap model, @ModelAttribute("category") Category category) {
		
		return "categoryForm";
	}
		
	
}
