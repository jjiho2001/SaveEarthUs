package com.seu.app;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.seu.app.interceptor.LoginInterceptor;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	private static final List<String> URL_PATTERNS = Arrays.asList(
			"/member/memberEdit","/member/memberEditOk"
			
			);
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);
	}
}
