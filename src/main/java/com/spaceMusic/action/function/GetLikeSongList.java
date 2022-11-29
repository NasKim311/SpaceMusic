package com.spaceMusic.action.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.action.Action;
import com.spaceMusic.action.ActionForward;
import com.spaceMusic.dao.MusicDAO;
import com.spaceMusic.dto.UserDTO;

public class GetLikeSongList implements Action { // 좋아요 누른 음악리스트만 가져오는 action (my menu page넘어갈 때 사용)

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MusicDAO mdao = new MusicDAO();

		String user_id = req.getParameter("user_id");

		req.setAttribute("getlikesonginfo", mdao.getlikesonginfo(user_id));
		req.setAttribute("getlikesong", mdao.getlikesong(user_id));
		
		forward.setRedirect(false);
		forward.setPath("/profile.jsp");

		return forward;

	} // execute()

} // GetLikeSongList class
