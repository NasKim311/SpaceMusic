package com.spaceMusic.action.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.dao.MusicDAO;

public class DeleteLikeSong { // 좋아요 취소시, 좋아하는 음악리스트 삭제하는 action

	public boolean execute(HttpServletRequest req, HttpServletResponse resp) {
		String music_id = req.getParameter("music_id");
		String user_id = req.getParameter("user_id");

		boolean result = false;

		MusicDAO mdao = new MusicDAO();

		if (mdao.deleteLikeSong(user_id, music_id) != 0) {
			// delete 성공
			result = true;
		}

		return result;

	} // execute()

} // DeleteLikeSong class
