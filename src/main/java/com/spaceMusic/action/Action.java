package com.spaceMusic.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { // servlet 사용하기 위한 interface

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp);
}
