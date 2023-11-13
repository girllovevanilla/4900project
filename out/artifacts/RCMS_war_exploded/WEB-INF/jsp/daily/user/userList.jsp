<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <table class="table table-striped table-bordered userListDiv" style="display: none;">
        <thead>
        <tr>
            <th class="text-center"> Serial number </th>
            <th class="text-center"> User Code </th>
            <th class="text-center"> User Name </th>
            <th class="text-center"> Identity </th>
            <th class="text-center"> Create Date </th>
            <th class="text-center"> Operation </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pager.list}" var="user" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${user.userCode}</td>
                <td class="text-center">${user.userName}</td>
                <td class="text-center">${user.identity}</td>
                <td class="text-center">
                    <fmt:formatDate value="${user.createDate}"
                                    pattern="yyyy-MM-dd" />
                        </td>
                <td class="text-center">
                    <button class="btn btn-danger delUserBtn" userId="${user.id}">Delete</button>
                    <button class="btn btn-success updateUserBtn" userId="${user.id}">Edit</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

<div class="row userListDiv" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
            <ul class="pager">
                <c:if test="${pager.pageIndex>1 }">
                    <li class="previous userListPagerBtn"><a pageIndex="${pager.pageIndex-1}" userSerchName="${pager.userSerchName}" opr="${pager.opr}"
                                                            href="javascript:;">
                        Previous </a></li>
                </c:if>
                <li class="h2">${pager.pageIndex
                        }/${pager.pageCount}</li>
                <c:if test="${pager.pageIndex<pager.pageCount }">
                    <li class="next userListPagerBtn"><a pageIndex="${pager.pageIndex+1}" userSerchName="${pager.userSerchName}" opr="${pager.opr}"
                                                        href="javascript:;">
                        Next page </a></li>
                </c:if>
            </ul>
        </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>

<script type="text/javascript">
    $(".userListDiv").fadeIn(200);
</script>
