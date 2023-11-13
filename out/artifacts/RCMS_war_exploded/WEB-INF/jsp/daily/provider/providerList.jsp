<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-striped table-bordered providerListDiv" style="display: none;">
    <thead>
    <tr>
        <th class="text-center"> Serial number </th>
        <th class="text-center"> Vendor name </th>
        <th class="text-center"> Main products </th>
        <th class="text-center"> Address </th>
        <th class="text-center"> Contact person </th>
        <th class="text-center"> Contact phone number </th>
        <th class="text-center"> Phone number </th>
        <th class="text-center"> Remarks </th>
        <th class="text-center"> Add time </th>
        <th class="text-center"> Operation </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pager.list}" var="provider" varStatus="statu">
        <tr>
            <td class="text-center">${statu.count}</td>
            <td class="text-center">${provider.proName}</td>
            <td class="text-center">${provider.product}</td>
            <td class="text-center">${provider.address}</td>
            <td class="text-center">${provider.contact}</td>
            <td class="text-center">${provider.telNumber}</td>
            <td class="text-center">${provider.phone}</td>
            <td class="text-center">${provider.remark}</td>
            <td class="text-center">
                <fmt:formatDate value="${provider.createDate}"
                                pattern="yyyy-MM-dd" />
            </td>
            <td class="text-center">
                <button class="btn btn-danger delProviderBtn" proId="${provider.id}">Delete</button>
                <button class="btn btn-success updateProviderBtn" proId="${provider.id}">Edit</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="row providerListDiv"style="display: none;" >
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
            <ul class="pager">
                <c:if test="${pager.pageIndex>1 }">
                    <li class="previous providerListPagerBtn"><a pageIndex="${pager.pageIndex-1}" serchProName="${pager.serchProName}" opr="${pager.opr}"
                                                             href="javascript:;">
                        Previous </a></li>
                </c:if>
                <li class="h2">${pager.pageIndex
                        }/${pager.pageCount}</li>
                <c:if test="${pager.pageIndex<pager.pageCount }">
                    <li class="next providerListPagerBtn"><a pageIndex="${pager.pageIndex+1}" serchProName="${pager.serchProName}" opr="${pager.opr}"
                                                         href="javascript:;">
                        Next page </a></li>
                </c:if>
            </ul>
        </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
<script type="text/javascript">
    $(".providerListDiv").fadeIn(200);
</script>

