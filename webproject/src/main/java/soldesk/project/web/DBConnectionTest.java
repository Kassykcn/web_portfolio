package soldesk.project.web;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

@Controller
public class DBConnectionTest {
	
	@Inject
	private DataSource dataSource;
	
	private static final Logger logger = LoggerFactory.getLogger(DBConnectionTest.class);
	
	@RequestMapping(value = "/db_test", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("DB Connection Test");
		try {
			Connection conn = (Connection) dataSource.getConnection();
			System.out.println("성공 : " + conn);
			model.addAttribute("result", "OK" );
		} catch (Exception ex){
			System.out.println("실패..!");
			model.addAttribute("result", "NO" );
			ex.printStackTrace();
		}
		return "db_test";
	}
	
}
