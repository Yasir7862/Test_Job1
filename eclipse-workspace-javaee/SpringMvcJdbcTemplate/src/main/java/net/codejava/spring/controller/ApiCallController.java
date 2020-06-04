package net.codejava.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

//import java.awt.PageAttributes.MediaType;

//import java.awt.PageAttributes.MediaType;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.model.Contact;

@Controller
@RequestMapping(value = "/ViewHighchart")
public class ApiCallController {
	@Autowired
	private ContactDAO contactDAO;
	@RequestMapping(value = "/postFileChartView", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<Contact> getAllData(Contact contact) {
		return contactDAO.list();
				
	}
	
	
	@RequestMapping(value = "/HighChart")
	public String showEmployeePage(){
		return "HighChartView";
	}
	
			
}
	
