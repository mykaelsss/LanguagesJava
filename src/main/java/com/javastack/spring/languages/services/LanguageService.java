package com.javastack.spring.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.javastack.spring.languages.models.Language;
import com.javastack.spring.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	
	private final LanguageRepository languageRepo;
	
	public LanguageService(LanguageRepository languageRepo) {
		this.languageRepo = languageRepo;
	}
	
	//Get All 
	public List<Language> allLanguages(){
		return languageRepo.findAll();
	}
	//Create
	public Language createLanguage(Language language) {
		return languageRepo.save(language);
	}
	//Get One 
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		}
		else {
			return optionalLanguage.orElse(null);
		}
	}
    //Update
    public Language updateLanguage(Language language) {
    	return languageRepo.save(language);
    }
    //Delete
    public void deleteLanguage(Language language) {
    	languageRepo.delete(language);
    }
}
