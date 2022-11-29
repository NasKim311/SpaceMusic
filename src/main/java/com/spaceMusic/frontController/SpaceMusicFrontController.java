package com.spaceMusic.frontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaceMusic.action.ActionForward;
import com.spaceMusic.action.function.DeleteLikeSong;
import com.spaceMusic.action.function.GetLikeSongList;
import com.spaceMusic.action.function.GoogleEmailAction;
import com.spaceMusic.action.function.IdCheckAction;
import com.spaceMusic.action.function.InsertLikeSong;
import com.spaceMusic.action.function.ProfileModify;
import com.spaceMusic.action.function.SignupAction;
import com.spaceMusic.action.function.getListAction;
import com.spaceMusic.action.function.getListByGenre;

@WebServlet("*.sm")
public class SpaceMusicFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	} // doGet()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	} // doPost()

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		switch (requestURI) {
		// top100 리스트 가져오는 경우
		case "/getList.sm":
			forward = new getListAction().execute(req, resp);
			System.out.println("controller");
			break;

		// 장르페이지 리스트 가져오는 경우
		case "/getListByGenre.sm":
			forward = new getListByGenre().execute(req, resp);
			break;

		// 회원가입 하는 경우
		case "/signup.sm":
			forward = new SignupAction().execute(req, resp);
			break;

		// 이메일 인증 하는 경우
		case "/sendEmail.sm":
			forward = new GoogleEmailAction().execute(req, resp);
			break;

		// 아이디 중복확인 하는 경우
		case "/sendId.sm":
			IdCheckAction idcheckaction = new IdCheckAction();
			boolean result = idcheckaction.execute(req, resp);
			PrintWriter out = resp.getWriter();
			out.println(result);
			break;

		// 좋아요 하트 눌렀을 경우
		case "/likeSongInsert.sm":
			InsertLikeSong insertlikesong = new InsertLikeSong();
			insertlikesong.execute(req, resp);
			break;

		// 좋아요 하트 취소했을 경우
		case "/likeSongDelete.sm":
			DeleteLikeSong deletelikesong = new DeleteLikeSong();
			deletelikesong.execute(req, resp);
			break;

		// 좋아요 누른 음악리스트만 가져오는 경우
		case "/getLikeSongList.sm":
			forward = new GetLikeSongList().execute(req, resp);
			break;

		// 회원정보 수정하는 경우
		case "/profileModify.sm":
			forward = new ProfileModify().execute(req, resp);
			break;

		} // doProcess() switch문

		// ---------페이지 일괄 처리-----------
		if (forward != null) {

			if (forward.isRedirect()) { // redirect 방식
				resp.sendRedirect(forward.getPath());

			} else { // forward 방식
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}

		} // doProcess() if문

	} // doProcess()

} // SpaceMusicFrontController class
