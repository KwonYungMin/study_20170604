<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <ul class="nav navbar-nav navbar-right">
		<li><p class="navbar-text">ID : <c:out value="${sessionScope.adminInfo.ADMIN_ID}"/></p><p class="navbar-text">�̸� : <c:out value="${sessionScope.adminInfo.ADMIN_NM}"/></p></li>
        <li><a href="/admin/logout">�α׾ƿ�</a></li>      
    </ul>