package com.spaceMusic.action.function;

import java.net.http.HttpResponse;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.dao.UserDAO;

public class IdCheckAction extends HttpServlet { // 아이디 중복확인하는 action

	public boolean execute(HttpServletRequest req, HttpServletResponse resp) {

		UserDAO udao = new UserDAO();

		String user_id = req.getParameter("user_id");

		boolean flag = false;

		if (udao.selectId(user_id) == null) {
			// 로그인 가능
			flag = true;
		}

		return flag;

	} // execute()

} // IdCheckAction class