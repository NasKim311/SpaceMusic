package com.spaceMusic.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.spaceMusic.dto.UserDTO;
import com.spaceMusic.mybatis.SqlMapConfig;

public class UserDAO { // User 관련 DAO

//----------------------<sql문 사용하기 위한 준비>---------------------------------------------------------------------------------------------------	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	// auto commit
	public UserDAO() {
		sqlsession = factory.openSession(true);
	}

//----------------------<로그인하는 메소드>---------------------------------------------------------------------------------------------------	
	public UserDTO getUser(String user_id, String user_pw) {

		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("user_pw", user_pw);

		UserDTO udto = sqlsession.selectOne("SpaceMusic.login", datas);

		return udto;
	}

//----------------------<회원가입하는 메소드>---------------------------------------------------------------------------------------------------	
	public boolean signUp(UserDTO udto) {
		boolean result = false;
		System.out.println("dao user_id : " + udto.getUser_id());

		if (sqlsession.insert("SpaceMusic.signup", udto) == 1) {
			result = true;
		}

		return result;
	}

//----------------------<아이디 중복확인하는 메소드>---------------------------------------------------------------------------------------------------	
	public String selectId(String user_id) {

		return sqlsession.selectOne("SpaceMusic.selectid", user_id);

	}

//----------------------<회원정보 수정하는 메소드>---------------------------------------------------------------------------------------------------	
	public void profileModify(HashMap datas) {

		HashMap<String, String> modifyname = new HashMap<>();
		HashMap<String, String> modifyphone = new HashMap<>();
		HashMap<String, String> modifypicture = new HashMap<>();
		HashMap<String, String> modifycomment = new HashMap<>();

		String user_id = (String) datas.get("user_id");
		String user_name = (String) datas.get("user_name");
		String user_phone = (String) datas.get("user_phone");
		String user_picture = (String) datas.get("user_picture");
		String user_comment = (String) datas.get("user_comment");

		modifyname.put("user_id", user_id);
		modifyname.put("user_name", user_name);

		modifyphone.put("user_id", user_id);
		modifyphone.put("user_phone", user_phone);

		modifypicture.put("user_id", user_id);
		modifypicture.put("user_picture", user_picture);

		modifycomment.put("user_id", user_id);
		modifycomment.put("user_comment", user_comment);

		if (!user_picture.equals((String) sqlsession.selectOne("SpaceMusic.getpicture", user_id))) {
			sqlsession.update("SpaceMusic.modifypicture", modifypicture);

		}

		sqlsession.update("SpaceMusic.modifyname", modifyname);
		sqlsession.update("SpaceMusic.modifyphone", modifyphone);
		sqlsession.update("SpaceMusic.modifycomment", modifycomment);

	}

//----------------------<수정된 회원정보 가져오는 메소드>---------------------------------------------------------------------------------------------------	
	public UserDTO modifyUserData(String user_id) {

		UserDTO udto = sqlsession.selectOne("SpaceMusic.modifyUserData", user_id);

		return udto;
	}

} // UserDAO class
