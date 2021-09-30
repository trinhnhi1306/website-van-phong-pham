package ptithcm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.model.Product;
import ptithcm.model.Student;

@Controller
@RequestMapping("/product")
public class ProductController {

	@RequestMapping("/list")
	public String list(ModelMap model ) {
		
		List<Product> list = new ArrayList<>();
		list.add(new Product("Nokia Star", 1000.0, 0.05));
		list.add(new Product("iPhone 9", 1500.0, 0.1));
		list.add(new Product("Samsung Galaxy N10", 750.0, 0.15));
		list.add(new Product("Sony Experia", 500.0, 0.0));
		
		model.addAttribute("prods", list);
		return "product/list";
		
		
	}
}
