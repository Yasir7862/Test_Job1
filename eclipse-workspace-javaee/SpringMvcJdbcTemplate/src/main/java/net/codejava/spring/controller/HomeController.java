package net.codejava.spring.controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.model.Contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


import org.springframework.ui.ModelMap;

/**
 * This controller routes accesses to the application to the appropriate
 * hanlder methods. 
 * @author www.codejava.net
 *
 */
@Controller
public class HomeController {

	@Autowired
	private ContactDAO contactDAO;
	
	@RequestMapping(value="/all/data")
	@ResponseBody
	public List<Contact> getAllData() {
		return contactDAO.list();
				
	}
		
	@RequestMapping(value="/")
	public ModelAndView listContact(ModelAndView model) throws IOException{
		List<Contact> listContact = contactDAO.list();
		model.addObject("listContact", listContact);
		model.setViewName("home");		
		return model;
	}
	

	@RequestMapping(value = "/newContact", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Contact newContact = new Contact();
		model.addObject("contact", newContact);
		model.setViewName("ContactForm");
		return model;
	}
	
	@RequestMapping(value = "/saveContact", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute Contact contact) {
		contactDAO.saveOrUpdate(contact);		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
	public ModelAndView deleteContact(HttpServletRequest request) {
		int contactId = Integer.parseInt(request.getParameter("id"));
		contactDAO.delete(contactId);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/editContact", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		int contactId = Integer.parseInt(request.getParameter("id"));
		Contact contact = contactDAO.get(contactId);
		ModelAndView model = new ModelAndView("ContactForm");
		model.addObject("contact", contact);
		
		return model;
	}
	
	//RequestMapping for new Jsp view of retrive data
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(ModelMap model) {
		return "chart";
	}
	@RequestMapping(value = "/getData", method = RequestMethod.POST)
	public @ResponseBody List<Contact> getData() {
		List<Contact> listcontact = new ArrayList<Contact>();
		try {
			Connection dbConnection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb", "root", "admin");
			// retrieve necessary records from database
			Statement getFromDb = (Statement) dbConnection.createStatement();
			ResultSet products = getFromDb
					.executeQuery("SELECT DirectoryName, FileName, Status, date FROM FileStatus WHERE contact_id =25");
			while (products.next()) {
				listcontact.add(new Contact(products.getString("DirectoryName"),
						products.getString("FileName"), products.getString("Status"), products.getString("Date")));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		}
		System.out.println(listcontact);
		return listcontact;
	
	}
	}
