<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table class="table table-striped table-bordered table-hover jinhuoList" style="display: none;">
    <thead>
    <tr>
        <th class="text-center"> Product name </th>
        <th class="text-center"> Order number </th>
        <th class="text-center"> Whether to pay </th>
        <th class="text-center"> Product quantity </th>
        <th class="text-center"> Purchase price </th>
        <th class="text-center"> Total price </th>
        <th class="text-center"> Vendor </th>
        <th class="text-center"> Purchase time </th>
        <th class="text-center"> Entry person </th>
        <th class="text-center"> Remarks </th>
        <th class="text-center"> Operation </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pager.list}" var="drinkbill">
        <tr>
            <td class="text-center">${drinkbill.productName}</td>
            <td class="text-center">${drinkbill.drinbillCode}</td>
            <td class="text-center">
                <c:if test="${drinkbill.isPay==1}">
                    Not paying
                </c:if>
                <c:if test="${drinkbill.isPay==2}">
                    Paid
                </c:if>
            </td>
            <td class="text-center">${drinkbill.proCount}${drinkbill.unit}</td>
            <td class="text-center">$${drinkbill.price}</td>
            <td class="text-center">$${drinkbill.totalCost}</td>
            <td class="text-center">${drinkbill.proName}</td>
            <td class="text-center">
                <fmt:formatDate value="${drinkbill.createDate}"
                                pattern="yyyy-MM-dd"/>
            </td>
            <td class="text-center">${drinkbill.createBy}</td>
            <td class="text-center">
                <c:if test="${drinkbill.remark=='' or drinkbill.remark==null}">Null</c:if>
                <c:if test="${drinkbill.remark!='' and drinkbill.remark!=null}">${drinkbill.remark}</c:if>
            </td>
            <td class="text-center">
                <a class="btn btn-danger delDrinkBill" drinkBillId="${drinkbill.id}">Delete</a>
                <c:if test="${drinkbill.isPay==1}">
                    <a class="btn btn-success updateDrinkBill" drinkBillId="${drinkbill.id}">Payment </a>
                </c:if>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
            <ul class="pager">
                <c:if test="${pager.pageIndex>1 }">
                    <li class="previous"><a pageIndex="${pager.pageIndex-1}"
                                            providerId="${pager.providerId}"
                                            productName="${pager.productName}"
                                            class="drinkBillPagerBtn"
                                            href="javascript:;">
                        Previous </a></li>
                </c:if>
                <li class="h2">${pager.pageIndex
                        }/${pager.pageCount}</li>
                <c:if test="${pager.pageIndex<pager.pageCount }">
                    <li class="next"><a pageIndex="${pager.pageIndex+1}"
                                        providerId="${pager.providerId}"
                                        productName="${pager.productName}"
                                        class="drinkBillPagerBtn"
                                        href="javascript:;">
                        Next page </a></li>
                </c:if>
            </ul>
        </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
<script type="text/javascript">
    $(".jinhuoList").fadeIn(200);
</script>