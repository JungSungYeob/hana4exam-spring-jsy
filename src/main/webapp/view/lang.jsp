<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div>
    <form action="/book/changelang" method="post">
        <label for="locale">
            <spring:message code="ln.language"/>
        </label>
        <select id="locale" name="locale" class="border" required>

            <c:forEach var="language" items="${languages}">
                <option value="${language.locale}" ${language.locale == currLang ? 'selected' : ''}>
                        ${language.lang}
                </option>
            </c:forEach>
        </select>
        <input type="hidden" name="redirectUrl" value="${currentUrl}">
        <button type="submit" class="border">
            <spring:message code="ln.apply"/>
        </button>
    </form>
</div>