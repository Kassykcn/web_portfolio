package com.mycompany.app;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class testDAOImpl implements testDAO {
	
	
	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public void a() {
		testDAO dao=sql.getMapper(testDAO.class);
		dao.a();
	}
	
	
	

}
