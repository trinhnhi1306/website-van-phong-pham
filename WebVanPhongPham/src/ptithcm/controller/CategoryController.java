package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
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
	public String addCategory(ModelMap model, @ModelAttribute("category") Category category, @RequestParam("file") MultipartFile file, BindingResult errors) {
		if (categoryService.getCategoryByName(category.getName()) != null) {
			errors.rejectValue("name", "category", "Tên loại đã được sử dụng!");
		}
		if (category.getName().length() > 100) {
			errors.rejectValue("name", "category", "Tên loại không được dài quá 100 ký tự!");
		}
		if (category.getNote().length() > 300) {
			errors.rejectValue("note", "category", "Ghi chú không được dài quá 300 ký tự!");
		}
		
		if(errors.hasErrors())
			return "admin/category/newCategory";
		else
		{
			int result = categoryService.addCategory(category, file);
			model.addAttribute("message", result);
		}	
		
		return "admin/category/newCategory";
	}
	
	@RequestMapping(value = "editCategory", method = RequestMethod.GET)
	public String editCategory(ModelMap model, @RequestParam("id") Integer id) {
		
		model.addAttribute("category", categoryService.getCategoryByID(id));
		return "admin/category/editCategory";
	}
	
	@RequestMapping(value = "editCategory", method = RequestMethod.POST)
	public String saveEdit(ModelMap model, @ModelAttribute("category") Category category, @RequestParam("file") MultipartFile file, BindingResult errors) {
		Category oldCategory = categoryService.getCategoryByID(category.getId());
		if (categoryService.getCategoryByName(category.getName()) != null && !category.getName().equalsIgnoreCase(oldCategory.getName())) {
			errors.rejectValue("name", "category", "Tên loại đã được sử dụng!");
		}
		if (category.getName().length() > 100) {
			errors.rejectValue("name", "category", "Tên loại không được dài quá 100 ký tự!");
		}
		if (category.getNote().length() > 300) {
			errors.rejectValue("note", "category", "Ghi chú không được dài quá 300 ký tự!");
		}
		
		if(errors.hasErrors())
			return "admin/category/editCategory";
		else
		{
			int result = categoryService.editCategory(category, file);
			model.addAttribute("message", result);
		}
		
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
