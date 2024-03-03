package com.jruiz.BrilliantIdeas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jruiz.BrilliantIdeas.models.Idea;
import com.jruiz.BrilliantIdeas.models.LoginUser;
import com.jruiz.BrilliantIdeas.models.User;
import com.jruiz.BrilliantIdeas.services.IdeaService;
import com.jruiz.BrilliantIdeas.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class IdeaController {
	
	@Autowired
	private UserService users;
	
	@Autowired
	private IdeaService ideas;
	
	

	@GetMapping("/")
	public String login(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/login.jsp";
	}
	
//	REGISTER
	@PostMapping("/register")
	public String register (@Valid @ModelAttribute("newUser")User newUser,
			BindingResult result, Model model, HttpSession session) {
		User user = users.register(newUser, result);
		
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}
	
//	LOGIN
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin")LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		
		User user= users.Login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		
		session.setAttribute("userId", user.getId());
		
		return "redirect:/dashboard";
	}
	
//DASHBOARD
	@GetMapping("/dashboard")
	public String dashboard(Model model,HttpSession session) {
		
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		
		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		return "dashboard.jsp";
	}
	
	
//	LOGOUT
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
//	CREATE
	@GetMapping("/create")
	public String create(@ModelAttribute("idea")Idea idea, Model model,HttpSession session) {
		
		User user = users.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		model.addAttribute("ideas",ideas.all());
		
		return "create.jsp";
	}
	
	
	@PostMapping("/ideas")
	public String createIdea(@Valid @ModelAttribute("idea")Idea idea, BindingResult result) {
		
		if(result.hasErrors()) {
			return "create.jsp";
		}
		
		ideas.create(idea);
		
		return "redirect:/create";
	}
	
	@GetMapping("/ideas/{id}")
	public String showpage(Model model, @PathVariable("id")Long id, HttpSession session) {
		
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		
		User user = users.findById(id);
		model.addAttribute("user", user);
//		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		
		return "view.jsp";
		
	}
	
	@DeleteMapping("/ideas/{id}")
	public String destroy(
			@PathVariable("id")Long id, Model model, HttpSession session,RedirectAttributes redirectAttributes) {
		Long userId = (Long)session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/dashboard";
		}
		Idea idea = ideas.findById(id);
		
		Long ideaUserId = idea.getUser().getId();
		
		if(!userId.equals(ideaUserId)) {
			redirectAttributes.addFlashAttribute("null","You cant do that no no no!");
			return "redirect:/dashboard";
		}
		
		ideas.destroy(id);
		
		return "redirect:/create";
	}
	
//	EDIT
	
	@GetMapping("/ideas/{id}/edit")
	public String update(
			@PathVariable("id")Long id,Model model,HttpSession session) {
		Long userId = (Long)session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/dashboard";
		}
		
		Idea idea = ideas.findById(id);
		model.addAttribute("idea", idea);
		
		return "edit.jsp";
		
	}
	
	
	@PutMapping("/ideas/{id}")
	public String updateThis(
			@PathVariable("id")Long id,
			@Valid @ModelAttribute("idea")Idea idea,
			BindingResult result,
			Model model,
			HttpSession session
			) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/dashboard";
		}
		if(result.hasErrors()) {
			return "return:edit.jsp";
		}
		
		idea.setUser(users.findById(userId));
		ideas.save(idea);
		
		return "redirect:/create";
		
	}
	
	
// IMPLEMENTANDO NUEVAS TABLAS Y NUEVAS COSAS!!!!

	
	
	
	
	
	
	
	
	
}
