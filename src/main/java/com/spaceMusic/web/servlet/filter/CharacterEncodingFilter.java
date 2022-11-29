package com.spaceMusic.web.servlet.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("*.sm")
public class CharacterEncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		// 한글 안깨지게 하는 인코딩 방법.
		arg0.setCharacterEncoding("utf-8");
		arg1.setCharacterEncoding("utf-8");
		arg1.setContentType("text/html; charset=utf-8"); 
		
		
		//System.out.println("before filter");
		// filterChain으로 다음 작업 진행 여부를 정한다.
		arg2.doFilter(arg0, arg1);
		//System.out.println("after filter");

	}
}
