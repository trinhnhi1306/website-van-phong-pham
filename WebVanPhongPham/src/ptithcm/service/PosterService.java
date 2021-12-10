package ptithcm.service;

import java.io.File;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.UploadFile;
import ptithcm.dao.PosterDAO;
import ptithcm.entity.Poster;

@Service
@Transactional
public class PosterService {

	@Autowired
	PosterDAO posterDAO;
	
	@Autowired
	@Qualifier("uploadfile")
	UploadFile uploadFile;
	
	public List<Poster> getAllPosters() {
		return posterDAO.getAllPosters();
	}
	
	public List<Poster> getActivedLeftPosters() {
		return posterDAO.getActivedLeftPosters();
	}
	
	public List<Poster> getActivedRightPosters() {
		return posterDAO.getActivedRightPosters();
	}
	
	public Poster getPosterById(int id) {
		return posterDAO.getPosterByID(id);
	}
	
	public int addPoster(Poster poster, MultipartFile file) {		
		try {	
			String fileName = uploadFile.setFileName(file);
				
	        String filePath = uploadFile.getBasePath() + "/poster" + File.separator + fileName;
//	        System.out.println(filePath);
	        file.transferTo(new File(filePath));
	            
			poster.setName(fileName);
		} catch (Exception e) {
			e.printStackTrace();
			return 2;		
		}
		
		return posterDAO.insertPoster(poster);
	}
	
	public int undisplayPoster(Poster poster) {
		poster.setIsActive(false);
		
		return posterDAO.undisplayPoster(poster);
	}
}
