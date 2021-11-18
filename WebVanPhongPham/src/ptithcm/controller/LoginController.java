package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Permission;
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
			userLogin = userService.getUserByUsername(user.getUsername());
			System.out.println("Tai khoan co ton tai!");
			if(BCrypt.checkpw(user.getPassword(), userLogin.getPassword())) {
				System.out.println("Mat khau dung!");
				if(userLogin.getPermission().getId() == 2) {
					System.out.println("Vai tro admin!");
					session.setAttribute("admin", userLogin);
					return "redirect:/admin.htm";
				}
				else {				
					System.out.println("Vai tro khach hang!");
					session.setAttribute("user", userLogin);
					session.setAttribute("cart", cartService.getCartByUserId(userLogin.getId()));
					session.setAttribute("totalItem", cartService.getTotalItem(userLogin.getId()));
					session.setAttribute("totalMoney", cartService.getTotalMoney(userLogin.getId()));
					return "redirect:/home.htm";	
				}
			}
			else {
				System.out.println("Sai mat khau!");
				model.addAttribute("message", "Sai mật khẩu!");
				return "account/login";
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
	public String logout(HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("admin") != null) {
			session.removeAttribute("admin");
		}
		else {
			session.removeAttribute("user");
			session.removeAttribute("cart");
			session.removeAttribute("totalItem");
			session.removeAttribute("totalMoney");
		}
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin/index";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String getRegisterView(@ModelAttribute("user") User user) {
		
		return "account/register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(HttpSession session, ModelMap model, @ModelAttribute("user") User user, @RequestParam("file") MultipartFile file) {
		
		int result = userService.addUser(user, null, file);
		
		session.setAttribute("user", userService.getUserByID(user.getId()));
		session.setAttribute("cart", cartService.getCartByUserId(user.getId()));
		session.setAttribute("totalItem", cartService.getTotalItem(user.getId()));
		session.setAttribute("totalMoney", cartService.getTotalMoney(user.getId()));
		return "redirect:/home.htm";	
	}
}
