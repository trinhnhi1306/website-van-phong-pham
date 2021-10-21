package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ProductController {

	@RequestMapping("listProduct")
	public String showListProduct() {
		return "admin/product/listProduct";
	}
	
	@RequestMapping("detailProduct")
	public String showDetailProduct() {
		return "admin/product/detailProduct";
	}
	
	@RequestMapping("newProduct")
	public String newProduct() {
		return "admin/product/newProduct";
	}
	
	@RequestMapping("editProduct")
	public String editProduct() {
		return "admin/product/editProduct";
	}
	
	@RequestMapping("searchProduct")
	public String searchProduct() {
		return "admin/product/listProduct";
	}
}
