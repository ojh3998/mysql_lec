package com.min.app06.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.app06.dao.IContactDao;
import com.min.app06.dto.ContactDto;

@Service // 서비스가 사용하는 @Component 입니다.
		 // 비지니스 계층(Business Layer)에서 사용합니다.

public class ContactServiceImpl implements IContactService {
	
	@Autowired
	private IContactDao contactDao;

	@Override
	public Map<String, Object> getAllContact() {
		// 	DAO로부터 연락처 목록을 가져옵니다.
		List<ContactDto> contacts = contactDao.getContactList();
		// 전체 연락처 갯수를 가져옵니다.
		int count = contactDao.getContactCount();
	    // 연락처 목록과 전체 연락처 갯수를 반환합니다.
		return Map.of("contacts", contacts, "count", count);
	}

	@Override
	public ContactDto getContact(int contact_id) {
		// 연락처 정보를 DAO로 부터 가져옵니다.
		ContactDto contactDto = contactDao.getContactById(contact_id);
		// 가져온 연락처를 반환합니다
		return contactDto;
	}

	@Override
	public String register(HttpServletRequest request) {
		// 요청 파라미터 4개를 이용해서 ContactDto로 만듭니다.
		ContactDto contactDto = ContactDto.builder()
								
								.last_name(request.getParameter("last_name"))
								.first_name(request.getParameter("first_name"))
								.email(request.getParameter("email"))
								.mobile(request.getParameter("mobile"))
								.build();
		// ContactDto를 DAO로 전달한 뒤 등록 결과를 성공/실패 메시지로 바꿔서 반환합니다.
		return contactDao.register(contactDto) == 1 ? "등록 성공" : "등록 실패";
	}
		 

	@Override
	public String modify(HttpServletRequest request) {
		// 요청 파라미터 5개를 이용해서 ContactDto로 만듭니다.
		ContactDto contactDto = ContactDto.builder()
								.contact_id(Integer.parseInt(request.getParameter("contact_id")))
								.last_name(request.getParameter("last_name"))
								.first_name(request.getParameter("first_name"))
								.email(request.getParameter("email"))
								.mobile(request.getParameter("mobile"))
								.build();
		
		// ContactDto를 DAO로 전달하고 수정 성공/실패 메세지를 만듭니다.
		String modifyMsg = contactDao.modify(contactDto) == 1 ? "수정 성공" : "수정 실패";
		// 수정 성공/실패 메세지를 반환합니다.
		return modifyMsg;
		
	}

	@Override
	public String reomve(HttpServletRequest request) {
		// 요청 파라미터 contact_id를 꺼냅니다. contact_id는 <form>태그에 포함되어 있기 때문에 반드시 전달됩니다. (null 체크는 필요 없다는 뜻입니다).
		// 대신 contact_id의 입력된 값이 없는 상태로 전달되면 빈 문자열("")이 전달됩니다. (공백 체크가 필요하다는 뜻.)
		String str_contact_id = request.getParameter("contact_id");
		int contact_id = 0; // 초기 상태는 삭제가 실패할 값을 저장해 둔다.
		if(!str_contact_id.isEmpty()) {
			contact_id = Integer.parseInt(str_contact_id);
		}
		// contact_id를 전달해서  삭제한 뒤 삭제 성공/실패 메시지를 반환합니다.
		
		return contactDao.remove(contact_id) == 1 ? "삭제 성공" : "삭제 실패";
	}

}
