package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.testDAO;

@Service
public class testServiceInfo implements testService {
	
	
	@Autowired
	private testDAO dao;

	@Override
	public void a() {
		dao.a();
		
	}
	
	

}
