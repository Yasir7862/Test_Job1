package net.codejava.spring.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.model.Contact;

@Controller
@RequestMapping(value = "/ajax")
public class AjaxHandlingController {

	@Autowired
	private ContactDAO contactDAO;
	@RequestMapping(value = "/getDefectCount", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody Contact postEmployeeData(@RequestBody Contact contact) {
 
		List<Contact> listContact = contactDAO.list();
		System.out.println(listContact);
		
		return (Contact) listContact;
	}
 
	@RequestMapping(value = "/developerDefects")
	public String showEmployeePage() {
		return "home";
	}

}
