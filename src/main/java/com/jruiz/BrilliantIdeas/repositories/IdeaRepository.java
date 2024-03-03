package com.jruiz.BrilliantIdeas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.jruiz.BrilliantIdeas.models.Idea;

public interface IdeaRepository extends CrudRepository<Idea, Long> {

	List<Idea> findAll();
	
}
