package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/login")
	public String getLoginView() {
		return "user/login";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String getRegisterView(Model model) {
		
		return "user/register";
	}
}
