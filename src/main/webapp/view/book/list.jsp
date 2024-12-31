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
        <spring:message code="ln.list"/>
    </h1>
    <table class="w-full">
        <tr class="border-b-2 border-black text-left">
            <th>도서명</th>
            <th>저자</th>
            <th>출판사</th>
            <th>ISBN</th>
            <th>대출가능</th>
        </tr>
        <c:forEach var="book" items="${books}">
            <tr class="border">
                <td><a href="/book/read/${book.bno}">${book.title}</a></td>
                <td>${book.author}</td>
                <td>${book.publisher}</td>
                <td>${book.isbn}</td>
                <td>
                    <c:choose>
                        <c:when test="${book.availability == 1}">
                            O
                        </c:when>
                        <c:otherwise>
                            X
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>