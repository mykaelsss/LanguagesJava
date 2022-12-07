package com.javastack.spring.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javastack.spring.languages.models.Language;
import com.javastack.spring.languages.services.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {
		
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
		this.languageService = languageService;
	}
	
	@GetMapping("")
	public String home(@ModelAttribute("language") Language language,Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute( "languages" ,languages);
		return "home.jsp";
	}
	@PostMapping("")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Language> languages = languageService.allLanguages();
			model.addAttribute("languages", languages);
			return "home.jsp";
		}
		else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@GetMapping("/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute(language);
		return "show.jsp";
	}
	
	@GetMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "edit.jsp";
	}
	
	@PutMapping("/{id}")
	public String pushEdit(@PathVariable("id") Long id, @Valid @ModelAttribute("language") Language language, BindingResult result ) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			languageService.updateLanguage(language);
			return "redirect:/languages";
		}
	}
	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		languageService.deleteLanguage(languageService.findLanguage(id));
		return "redirect:/languages";
	}
}
