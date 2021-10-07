package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/home")
public class WelcomeController {

	@RequestMapping("home")
	public String showHome() {
		return "user/home";
	}
}
