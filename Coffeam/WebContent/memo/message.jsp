<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- core 태그 라이브러리 : 핵심 제어문(if, forEach..)들이 있다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${msg != null}">
	<script type="text/javascript">
		alert('${msg}');
		location.href='${loc}';
	</script>
</c:if>

<c:if test="${msg == null}">
	<script>
		location.href='${loc}';
	</script>
</c:if>