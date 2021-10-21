package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class CategoryController {

	@RequestMapping("listCategory")
	public String showListCategory() {
		return "admin/category/listCategory";
	}
	
	@RequestMapping("newCategory")
	public String newCategory() {
		return "admin/category/newCategory";
	}
	
	@RequestMapping("editCategory")
	public String editCategory() {
		return "admin/category/editCategory";
	}
	
	@RequestMapping("searchCategory")
	public String searchCategory() {
		return "admin/category/listCategory";
	}
}
