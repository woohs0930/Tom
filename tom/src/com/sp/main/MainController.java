package com.sp.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mainController")
public class MainController {
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() throws Exception {
		return ".mainLayout";
	}
}
