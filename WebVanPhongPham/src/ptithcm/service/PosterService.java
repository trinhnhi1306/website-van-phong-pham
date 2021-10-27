package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.PosterDAO;
import ptithcm.entity.Poster;

@Service
@Transactional
public class PosterService {

	@Autowired
	PosterDAO posterDAO;
	
	public List<Poster> getAllPosters() {
		return posterDAO.getAllPosters();
	}
	
	public List<Poster> getActivedLeftPosters() {
		return posterDAO.getActivedLeftPosters();
	}
	
	public List<Poster> getActivedRightPosters() {
		return posterDAO.getActivedRightPosters();
	}
}
