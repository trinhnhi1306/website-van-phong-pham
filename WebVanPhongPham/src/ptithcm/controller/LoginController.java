package ptithcm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.User;
import ptithcm.service.CartService;
import ptithcm.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;

	@Autowired
	CartService cartService;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String getLoginView(@ModelAttribute("user") User user) {
		return "account/login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("user") User user, HttpSession session) {
		
		User userLogin;
		try {
			userLogin = userService.getUserByUsername(user.getUsername(), user.getPassword());
			System.out.println("Dang nhap thành công!");
			
			if(userLogin.getPermission().getId() == 2) {
				session.setAttribute("admin", userLogin);
				return "redirect:/admin.htm";
			}
			else {				
				session.setAttribute("user", userLogin);
				session.setAttribute("cart", cartService.getCartByUserId(userLogin.getId()));
				session.setAttribute("totalItem", cartService.getTotalItem(userLogin.getId()));
				session.setAttribute("totalMoney", cartService.getTotalMoney(userLogin.getId()));
				return "redirect:/home.htm";	
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Tai khoan khong ton tai!");
			model.addAttribute("message", "Tài khoản không tồn tại!");
			return "account/login";
		}	
					
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		if(session.getAttribute("admin") != null)
			session.removeAttribute("admin");
		else
		{
			session.removeAttribute("user");
			session.removeAttribute("cart");
			session.removeAttribute("totalItem");
			session.removeAttribute("totalMoney");
		}
		return "redirect:/login.htm";	
	}
	
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin/index";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String getRegisterView(Model model) {
		
		return "account/register";
	}
}
