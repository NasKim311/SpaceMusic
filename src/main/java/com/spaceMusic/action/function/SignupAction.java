package com.spaceMusic.action.function;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spaceMusic.action.Action;
import com.spaceMusic.action.ActionForward;
import com.spaceMusic.dao.UserDAO;
import com.spaceMusic.dto.UserDTO;

public class SignupAction implements Action { // 회원가입하는 action

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();

		String uploadPath = "C:/SpaceMusic_Project/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SpaceMusic-ver-final/upload";
		int size = 10 * 1024 * 1024;
		String user_id = "";
		String user_pw = "";
		String user_name = "";
		String user_email = "";
		String user_phone = "";
		String user_picture = "";
		String user_comment = "";

		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());

			user_id = multi.getParameter("user_id");
			user_pw = multi.getParameter("user_pw");
			user_name = multi.getParameter("user_name");
			user_email = multi.getParameter("user_email");
			user_phone = multi.getParameter("user_phone");
			user_comment = multi.getParameter("user_comment");

			Enumeration files = multi.getFileNames();

			String user_picture1 = (String) files.nextElement();
			user_picture = multi.getFilesystemName(user_picture1);

		} catch (Exception e) {
			e.printStackTrace();

		} // try ~ catch문

		udto.setUser_id(user_id);
		udto.setUser_pw(user_pw);
		udto.setUser_name(user_name);
		udto.setUser_email(user_email);
		udto.setUser_phone(user_phone);
		udto.setUser_picture(user_picture);
		udto.setUser_comment(user_comment);

		udao.signUp(udto);

		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/index.jsp");

		return forward;

	} // execute()

} // SignupAction class
