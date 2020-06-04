package net.codejava.spring.controller;
import java.io.IOException;
import net.codejava.spring.dao.ContactDAO;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.model.Contact;

@Controller
@RequestMapping(value = "/MultiLineHighchart")
public class MuliLineController {
	@RequestMapping(value = "/FileChartView")
	public String showEmployeePage(){
		return "FilesChartView";
	}

		

}
