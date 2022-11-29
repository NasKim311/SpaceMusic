package com.spaceMusic.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.spaceMusic.mybatis.SqlMapConfig;

public class ArtistDAO {

	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ArtistDAO() {
		sqlsession = factory.openSession(true);
	}
	
	
	
	
	
	
	
	
	
	
}	// ArtistDAO class
