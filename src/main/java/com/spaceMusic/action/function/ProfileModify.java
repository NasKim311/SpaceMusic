package com.spaceMusic.action.function;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spaceMusic.action.Action;
import com.spaceMusic.action.ActionForward;
import com.spaceMusic.dao.UserDAO;

public class ProfileModify implements Action { // 회원정보 수정하는 action

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();

		UserDAO udao = new UserDAO();
		HashMap<String, String> datas = new HashMap<>();

		String uploadPath = "C:/SpaceMusic_Project/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SpaceMusic-ver-final/upload";
		int size = 10 * 1024 * 1024;
		String user_id = "";
		String user_name = "";
		String user_phone = "";
		String user_picture = "";
		String user_picture_ = "";
		String user_pictureOld = "";
		String user_comment = "";

		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());

			user_id = multi.getParameter("user_id");
			user_name = multi.getParameter("user_name");
			user_phone = multi.getParameter("user_phone");
			user_comment = multi.getParameter("user_comment");
			user_pictureOld = multi.getParameter("user_pictureOld");

			Enumeration files = multi.getFileNames();

			String user_picture1 = (String) files.nextElement();
			user_picture = multi.getFilesystemName(user_picture1);

			if (user_pictureOld.equals(user_picture) || user_picture == null) {
				user_picture_ = user_pictureOld;
			} else {
				user_picture_ = user_picture;
			}

		} catch (Exception e) {
			System.out.println("catch문");
			e.printStackTrace();

		} // try ~ catch문

		datas.put("user_id", user_id);
		datas.put("user_name", user_name);
		datas.put("user_phone", user_phone);
		datas.put("user_comment", user_comment);
		datas.put("user_picture", user_picture_);

		udao.profileModify(datas);
		req.setAttribute("user_id", user_id);

		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/profile_action.jsp");

		return forward;

	} // execute()

} // ProfileModify class
