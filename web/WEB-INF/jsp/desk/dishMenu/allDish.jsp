<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<h4>
    <c:if test="${pager.opr}=='allDish'">All</c:if>
    <c:if test="${pager.opr}=='soup'">Soup</c:if>
    <c:if test="${pager.opr}=='other'">Other</c:if>
    <c:if test="${pager.opr}=='drink'">Drink</c:if>
    <c:if test="${pager.opr}=='fry'">Fry</c:if>
</h4>
<base href="<%=basePath%>">
<div class="row dishMenu" style="display: none;">
    <table class="table table-condensed">
        <tbody>
        <c:forEach items="${pager.list }" var="dish" varStatus="statu">
            <c:if test="${statu.index%4==0}">
                <tr>
            </c:if>
            <td>
           <%-- <div class="col-lg-3">--%>
                <a href="javascript:;" style="text-decoration:none;"
                   class="dishBtn"
                   dishName="${dish.dishName }" drinkBillCode="${dish.drinkBillCode }"  dishPrice="${dish.price }"><img style="width: 121px;height: 79px;"
                                                                                src="${pageContext.request.contextPath}/assets/img/${dish.fileName}"
                                                                                class="img-thumbnail">
                </a>
                <p class="h6" style="font-weight: bold;">${dish.dishName }</p>
                <p class="h6">
                    Price: $<span>${dish.price }</span>
                </p>
<%--            </div>--%>
            </td>
            <c:if test="${statu.count%4==0}">
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="row">
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
    <div class="col-lg-8  col-md-8 col-sm-8 col-xs-8 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
            <ul class="pager">
                    <%--  <c:if test="${pager.pageIndex>1 }">--%>
                <li class="previous dishMenuPagerBtn"><a pageIndex="${pager.pageIndex-1}"
                                                         opr="${pager.opr}" href="javascript:;">
                    Previous </a></li>
                    <%--  </c:if>--%>
                <li class="h2">${pager.pageIndex
                        }/${pager.pageCount}</li>
                    <%--<c:if test="${pager.pageIndex<pager.pageCount }">--%>
                <li class="next dishMenuPagerBtn"><a pageIndex="${pager.pageIndex+1}"
                                                     opr="${pager.opr}" href="javascript:;">
                    Next page </a></li>
                    <%-- </c:if>--%>
            </ul>
        </c:if>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 "></div>
</div>
<script type="text/javascript">
    $(".dishMenu").slideDown(200);
</script>