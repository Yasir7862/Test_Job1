package net.codejava.spring.controller;



import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.model.Contact;
//import net.codejava.spring.model.Employee;



@Controller
@RequestMapping(value = "/FileStats")
public class JsonRequestController {
	@Autowired
	private ContactDAO contactDAO;
	@RequestMapping(value = "/postFileChartView", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<Contact> getAllData(Contact contact) {
		return contactDAO.list();
				
	}
	
	
	@RequestMapping(value = "/FileChartView")
	public String showEmployeePage(){
		return "HighChartView";
	}
	
			
}
