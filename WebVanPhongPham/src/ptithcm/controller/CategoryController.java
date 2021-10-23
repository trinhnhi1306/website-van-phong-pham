package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Category;
import ptithcm.service.CategoryService;

@Controller
@RequestMapping("/admin")
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
		
	@RequestMapping(value = "listCategory", method = RequestMethod.GET)
	public String showListCategory(HttpServletRequest request, ModelMap model) {
	
		List<Category> list = categoryService.getAllCategories();
		
		// bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = categoryService.paging(list, request);
	
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/category/listCategory";
	}
	
	@RequestMapping(value = "newCategory", method = RequestMethod.GET)
	public String newCategory(@ModelAttribute("category") Category category) {
		return "admin/category/newCategory";
	}
	
	@RequestMapping(value = "newCategory", method = RequestMethod.POST)
	public String addCategory(HttpServletRequest request, ModelMap model, @ModelAttribute("category") Category category, @RequestParam("file") MultipartFile file) {
		
		int result = categoryService.addCategory(request, category, file);
		model.addAttribute("message", result);
		
		return "admin/category/newCategory";
	}
	
	@RequestMapping(value = "editCategory", method = RequestMethod.GET)
	public String editCategory(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		
		model.addAttribute("category", categoryService.getCategoryByID(id));
		return "admin/category/editCategory";
	}
	
	@RequestMapping(value = "editCategory", method = RequestMethod.POST)
	public String saveEdit(HttpServletRequest request, ModelMap model, @ModelAttribute("category") Category category, @RequestParam("file") MultipartFile file) {
		
		int result = categoryService.editCategory(request, category, file);
		model.addAttribute("message", result);
		
		return "admin/category/editCategory";
	}
	
	
	@RequestMapping(value = "deleteCategory", method = RequestMethod.GET)
	public String deleteCategory(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		
		int result = categoryService.deleteCategory(categoryService.getCategoryByID(id));
		model.addAttribute("message", result);
		
		List<Category> list = categoryService.getAllCategories();
		
		//bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = categoryService.paging(list, request);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/category/listCategory";
	}
	
	@RequestMapping("searchCategory")
	public String searchCategory(HttpServletRequest request, ModelMap model) {
		
		String name = request.getParameter("searchInput");
		
		
		List<Category> list = categoryService.searchCategories(name);
		
		//bỏ dữ liệu vào pagedListHolder rồi sau đó trả về cho model
		PagedListHolder pagedListHolder = categoryService.paging(list, request);
		
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/category/listCategory";
	}
}
