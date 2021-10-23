package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class PosterController {

	@RequestMapping("listPoster")
	public String showListPoster() {
		return "admin/poster/listPoster";
	}
	
	@RequestMapping("showPoster")
	public String showPoster() {
		return "admin/poster/showPoster";
	}
	
	@RequestMapping("newPoster")
	public String newPoser() {
		return "admin/poster/newPoster";
	}
}
