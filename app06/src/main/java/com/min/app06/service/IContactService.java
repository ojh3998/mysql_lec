package com.min.app06.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.min.app06.dto.ContactDto;

public interface IContactService {
	Map<String, Object> getAllContact();
	ContactDto getContact(int contact_id);
	String register(HttpServletRequest request);
	String modify(HttpServletRequest request);
	String reomve(HttpServletRequest request);

}
