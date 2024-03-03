package com.jruiz.BrilliantIdeas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jruiz.BrilliantIdeas.models.Idea;
import com.jruiz.BrilliantIdeas.repositories.IdeaRepository;

@Service
public class IdeaService {

	@Autowired
	private IdeaRepository repo;
	
//	FIND BY ID
	
	public Idea findById(Long id) {
		Optional<Idea> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
//	FIND ALL
	
	public List<Idea>all(){
		return repo.findAll();
	}
	
//	CREATE
	
	public Idea create(Idea idea) {
		return repo.save(idea);
	}
	
//	SAVE
	
	public void save(Idea idea) {
		repo.save(idea);
	}
	
	
//  DELETE	
	
	public void destroy(Long id) {
		repo.deleteById(id);
	}
	
}
