<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-striped table-bordered table-hover drinkSellList" style="display: none;">
    <thead>
    <tr>
        <th class="text-center"> Product name </th>
        <th class="text-center"> Order number </th>
        <th class="text-center"> Sales volume </th>
        <th class="text-center"> Unit price </th>
        <th class="text-center"> Total </th><%--
        <th class="text-center">操作</th>--%>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${pager.list}" var="drinkSellBill">
            <tr>
                <td class="text-center">${drinkSellBill.productName}</td>
                <td class="text-center">${drinkSellBill.drinkBillCode}</td>
                <td class="text-center">${drinkSellBill.sellCount}</td>
                <td class="text-center">￥${drinkSellBill.sellPrice}</td>
                <td class="text-center">￥${drinkSellBill.sellPrice*drinkSellBill.sellCount}</td>
                <%--<td class="text-center"><a class="btn btn-danger delDrinkSellBill" drinkSellBillId="${drinkSellBill.id}">删除</a></td>--%>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div class="row drinkSellList" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
        <ul class="pager">
             <c:if test="${pager.pageIndex>1 }">
            <li class="previous"><a pageIndex="${pager.pageIndex-1}"
                                    providerId="${pager.providerId}"
                                    productName="${pager.productName}"
                                    class="drinkSellBillPagerBtn"
                                    href="javascript:;">
                Previous </a></li>
               </c:if>
            <li class="h2">${pager.pageIndex
                    }/${pager.pageCount}</li>
            <c:if test="${pager.pageIndex<pager.pageCount }">
            <li class="next"><a pageIndex="${pager.pageIndex+1}"
                                providerId="${pager.providerId}"
                                productName="${pager.productName}"
                                class="drinkSellBillPagerBtn"
                                href="javascript:;">
                Next page </a></li>
             </c:if>
        </ul>
         </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
<script type="text/javascript">
    $(".drinkSellList").fadeIn(200);
</script>
