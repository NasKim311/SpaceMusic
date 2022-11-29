package com.spaceMusic.action.function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.action.Action;
import com.spaceMusic.action.ActionForward;
import com.spaceMusic.dao.MusicDAO;

public class getListByGenre implements Action {		// 장르음악리스트 가져오는 action

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MusicDAO mdao = new MusicDAO();
		
		int genre_id = Integer.parseInt(req.getParameter("genre_id"));
		String user_id = req.getParameter("user_id");

		
		req.setAttribute("MusicArr", mdao.MusicArr(genre_id));
		req.setAttribute("MusicListByGenre", mdao.getMusicListByGenre(genre_id));
		req.setAttribute("getlikesong", mdao.getlikesong(user_id));
		
		forward.setRedirect(false);
		forward.setPath("/sortByGenre.jsp");

		return forward;
		
	}	// execute()

}	// getListByGenre class
