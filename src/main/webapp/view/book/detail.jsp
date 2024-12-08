<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<%@ include file="../head.jsp" %>
<body class="w-full items-center justify-center flex flex-col">
<jsp:include page="../lang.jsp"/>
<div class="flex flex-col w-3/4 p-4">
    <h1 class="w-full text-left text-4xl font-bold">
        <spring:message code="ln.detail"/>
    </h1>
    <ul>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">도서명</h4>
            <p class="flex-grow">${book.title}</p>
        </li>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">저자</h4>
            <p class="flex-grow">${book.author}</p>
        </li>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">출판사</h4>
            <p class="flex-grow">${book.publisher}</p>
        </li>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">요약보기</h4>
            <p class="flex-grow">${book.description}</p>
        </li>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">ISBN</h4>
            <p class="flex-grow">${book.isbn}</p>
        </li>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">대출가능</h4>
            <p class="flex-grow">
                <c:choose>
                    <c:when test="${book.availability == 1}">
                        O
                    </c:when>
                    <c:otherwise>
                        X
                    </c:otherwise>
                </c:choose>
            </p>
        </li>
        <li class="flex flex-row border-b py-4">
            <h4 class="font-bold w-[80px]">신청자</h4>
            <form action="/book/borrow" method="post" class="flex flex-col w-full items-start mb-0">
                <input type="text" name="borrowerId"
                       class="border w-full focus:outline-none px-2 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 rounded-lg"
                       required ${book.availability == 1 ? "" : "disabled" } />
                <input type="hidden" name="bno" value="${book.bno}">
                <button type="submit"
                        class="bg-blue-500 mt-4 py-2 px-4 rounded-lg text-white" ${book.availability == 1 ? "" : "disabled" }>
                    대출 신청
                </button>
            </form>
        </li>
    </ul>
</div>
</body>