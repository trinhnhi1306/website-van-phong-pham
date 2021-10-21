package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class BrandController {
	
	@RequestMapping("listBrand")
	public String showListBrand() {
		return "admin/brand/listBrand";
	}
	
	@RequestMapping("newBrand")
	public String newBrand() {
		return "admin/brand/newBrand";
	}
	
	@RequestMapping("editBrand")
	public String editBrand() {
		return "admin/brand/editBrand";
	}
	
	@RequestMapping("searchBrand")
	public String searchBrand() {
		return "admin/brand/listBrand";
	}
}
