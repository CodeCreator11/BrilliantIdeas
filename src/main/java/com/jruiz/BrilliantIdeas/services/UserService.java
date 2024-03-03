package com.jruiz.BrilliantIdeas.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jruiz.BrilliantIdeas.models.LoginUser;
import com.jruiz.BrilliantIdeas.models.User;
import com.jruiz.BrilliantIdeas.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository repo;
	
	@Autowired
	private UserRepository uRepo;
	
public User register(User newUser, BindingResult result) {
	
	Optional<User> userFind = uRepo.findByEmail(newUser.getEmail());
	if(userFind.isPresent()) {
		result.rejectValue("email", "Unique", "Email already exists.");
	}
	
	if(!newUser.getPassword().equals(newUser.getConfirm())) {
		result.rejectValue("confirm", "Matches", "Confirma password must to match");
	}
	
	if(result.hasErrors()) {
		return null;
	}
	
	
//	HASH PSW
	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
	newUser.setPassword(hashed);
	
	newUser = repo.save(newUser);
	
	return newUser;
}
	
	
//LOGIN
public User Login(LoginUser newLogin,BindingResult result) {
	
	Optional<User> userFind = uRepo.findByEmail(newLogin.getEmail());
	if(!userFind.isPresent()) {
		result.rejectValue("email", "MissingAccount", "No account Found");
		return null;
	}
	
	User user = userFind.get();
	
	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
		result.rejectValue("password", "Matches", "Invalid Password");
	}
	if(result.hasErrors()) {
		return null;
	}
	return user;
	
}
	
public User findByEmail(String email) {
	Optional<User> result = repo.findByEmail(email);
	if(result.isPresent()) {
		return result.get();
	}
	return null;
}	

public User findById(Long id) {
	Optional<User> result = repo.findById(id);
	if(result.isPresent()) {
		return result.get();
	}
	return null;
}
	
}
