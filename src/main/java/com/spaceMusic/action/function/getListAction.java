package com.spaceMusic.action.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.action.Action;
import com.spaceMusic.action.ActionForward;
import com.spaceMusic.dao.MusicDAO;

public class getListAction implements Action { // 좋아요누른 음악과 좋아요 누르지 않은 음악 둘다 가져오는 action

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MusicDAO mdao = new MusicDAO();
		String user_id = req.getParameter("user_id");

		req.setAttribute("MusicList", mdao.getMusicList());
		req.setAttribute("AllMusicArr", mdao.AllMusicArr());
		req.setAttribute("getlikesong", mdao.getlikesong(user_id));

		forward.setRedirect(false);
		forward.setPath("/top100.jsp");

		return forward;

	}	// execute()
	
}	// getListAction class
