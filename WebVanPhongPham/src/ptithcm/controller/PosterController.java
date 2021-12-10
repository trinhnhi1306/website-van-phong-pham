package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Poster;
import ptithcm.service.PosterService;

@Controller
@RequestMapping("/admin")
public class PosterController {

	@Autowired
	PosterService posterService;
	
	
	@RequestMapping("listPoster")
	public String showListPoster(ModelMap model) {
		List<Poster> list = posterService.getAllPosters();
		
		model.addAttribute("list", list);
		return "admin/poster/listPoster";
	}
	
	@RequestMapping("showPoster")
	public String showPoster(ModelMap model) {
		List<Poster> left = posterService.getActivedLeftPosters();
		List<Poster> right = posterService.getActivedRightPosters();
		
		model.addAttribute("leftPoster", left);
		model.addAttribute("rightPoster", right);
		return "admin/poster/showPoster";
	}
	
	@RequestMapping(value="newLeftPoster", method = RequestMethod.GET)
	public String newLeftPoser(@ModelAttribute("poster") Poster poster) {
		
		return "admin/poster/newPoster";
	}
	
	@RequestMapping(value="newLeftPoster", method = RequestMethod.POST)
	public String newLeftPoser(ModelMap model, @ModelAttribute("poster") Poster poster, @RequestParam("file") MultipartFile file, BindingResult errors) {
		poster.setType(1);
		poster.setIsActive(true);
		
		if(file.isEmpty()) {
			model.addAttribute("message", 2);
			return "admin/poster/newPoster";
		}
		
		int result = posterService.addPoster(poster, file);
		model.addAttribute("message", result);
		return "admin/poster/newPoster";
	}
	
	@RequestMapping(value="changeRightPoster", method = RequestMethod.GET)
	public String changeRightPoser(ModelMap model, @RequestParam("id") Integer id) {
		
//		model.addAttribute("poster", posterService.getPosterById(id));
		posterService.undisplayPoster(posterService.getPosterById(id));
		return "admin/poster/changePoster";
	}
	
	@RequestMapping(value="changeRightPoster", method = RequestMethod.POST)
	public String changeRightPoser(ModelMap model, @ModelAttribute("poster") Poster poster, @RequestParam("file") MultipartFile file, BindingResult errors) {
		poster.setType(2);
		poster.setIsActive(true);
		
		if(file.isEmpty()) {
			model.addAttribute("message", 2);
			return "admin/poster/changePoster";
		}
		
		int result = posterService.addPoster(poster, file);
		model.addAttribute("message", result);
		return "admin/poster/changePoster";
	}
	
	@RequestMapping(value="undisplayPoster", method = RequestMethod.GET)
	public String undisplayPoster(HttpServletRequest request, ModelMap model, @RequestParam("id") Integer id) {
		int result = posterService.undisplayPoster(posterService.getPosterById(id));
		model.addAttribute("message", result);
		
		List<Poster> left = posterService.getActivedLeftPosters();
		List<Poster> right = posterService.getActivedRightPosters();
		
		model.addAttribute("leftPoster", left);
		model.addAttribute("rightPoster", right);
		
		return "admin/poster/showPoster";
	}
}
