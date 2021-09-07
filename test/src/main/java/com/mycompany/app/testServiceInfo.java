package com.mycompany.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class testServiceInfo implements testService {
	
	
	@Autowired
	private testDAO dao;

	@Override
	public void a() {
		dao.a();
		
	}
	
	

}
