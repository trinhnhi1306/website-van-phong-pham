package ptithcm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.User;
import ptithcm.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String getLoginView(@ModelAttribute("user") User user) {
		return "account/login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) {
		
		User userLogin;
		try {
			userLogin = userService.getUserByUsername(user.getUsername(), user.getPassword());
			System.out.println("Dang nhap thành công!");
			session.setAttribute("user", userLogin);
			if(userLogin.getPermission().getId() == 2)
				return "redirect:/admin.htm";
			else
				return "redirect:/home.htm";	
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Dang nhap that bai!");
			return "account/login";
		}	
					
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		System.out.println(user.getUsername());
		session.removeAttribute("user");
		
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
