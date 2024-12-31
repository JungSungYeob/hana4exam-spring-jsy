<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<%@ include file="../head.jsp" %>
<body class="w-full items-center justify-center flex flex-col">
<jsp:include page="../lang.jsp"/>
<div class="flex flex-col w-3/4 p-4">
    <h1 class="w-full text-left text-4xl font-bold">
        <spring:message code="ln.result"/>
    </h1>
    <ul>
        <li class="grid grid-cols-2 border-b py-4">
            <h4 class="font-bold">도서명</h4>
            <p class="">${book.title}</p>
        </li>
        <li class="grid grid-cols-2 border-b py-4">
            <h4 class="font-bold w-[80px]">저자</h4>
            <p class="">${book.author}</p>
        </li>
        <li class="grid grid-cols-2 border-b py-4">
            <h4 class="font-bold w-[80px]">출판사</h4>
            <p class="">${book.publisher}</p>
        </li>
        <li class="grid grid-cols-2 border-b py-4">
            <h4 class="font-bold w-[80px]">신청자</h4>
            <p class="">${book.borrowerId}</p>
        </li>
        <li class="grid grid-cols-2 border-b py-4">
            <h4 class="font-bold w-[80px]">대출일</h4>
            <p class="">
                ${fn:substringBefore(book.startDate, 'T')}
            </p>
            </p>
        </li>
        <li class="grid grid-cols-2 border-b py-4">
            <h4 class="font-bold w-[80px]">대출일</h4>
            <p class="">
                ${fn:substringBefore(book.endDate, 'T')}
            </p>
        </li>
    </ul>
    <div class="flex w-full justify-end mt-2">
        <a href="/book/list" class="bg-blue-500 py-2 px-4 rounded-lg text-white">목록보기</a>
    </div>
</div>
</body>