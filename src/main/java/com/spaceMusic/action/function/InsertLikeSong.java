package com.spaceMusic.action.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.dao.MusicDAO;

public class InsertLikeSong { // 좋아요 클릭했을 때, 음악리스트 추가되는 action

	public boolean execute(HttpServletRequest req, HttpServletResponse resp) {

		String music_id = req.getParameter("music_id");
		String user_id = req.getParameter("user_id");

		boolean result = false;

		MusicDAO mdao = new MusicDAO();

		if (mdao.insertLikeSong(user_id, music_id) != 0) {
			result = true;
		}

		return result;

	} // exrcute()

} // InsertLikeSong class
