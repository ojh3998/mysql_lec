<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=devive-width, initial-scale=1.0">
<title>Contact List</title>
</head>
<body>


 	<h1>Contact List</h1>
 	
 	<div>전체 연락처 : ${count}개</div>
 	
 	<div>
 		<button type="button" onclick="fnWriteForm()">등록</button>
 	</div>
 	
 	<%-- List의 인덱스가 필요한 경우 varStatus 태그속성을 만들고 인덱스 값을 꺼냅니다. --%>
 	<c:forEach var="contact" items="${contacts}" varStatus="vs">
 	  <div id="contact${vs.index}" class="contact">                                        <%-- forEach 안에 <div 그냥id만>  줄 수 없음 --%>
		<a href="${contextPath}/contact/detail.do?contact_id=${contact.contact_id}">${contact.contact_id} : ${contact.last_name}</a>	 	
 	  </div>
 	</c:forEach>
 	
 	
 	<script>
 	
 	function fnWriteForm() {
 		location.href = "${contextPath}/contact/write.do"
 	}
 	
 	const msg = '${msg}';
 	if(msg !=='') {
 		alert(msg);
 	}
 	
 	
 	</script>
 	

</body>
</html>
 	
 	
 	
 	
 	