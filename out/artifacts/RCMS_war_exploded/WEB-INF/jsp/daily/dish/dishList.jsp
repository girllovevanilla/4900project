<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-lg-12  dishList"  style="display: none;" >
    <br>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th class="text-center"> Menu name </th>
            <th class="text-center"> Menu price </th>
            <th class="text-center"> Menu type </th>
            <th class="text-center"> Operation </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pager.list}" var="dish" >
            <tr>
                <td class="text-center">${dish.dishName}</td>
                <td class="text-center">$${dish.price}</td>
                <td class="text-center">
                    <c:if test="${dish.type=='1'}">Soup</c:if>
                    <c:if test="${dish.type=='2'}">Stir Fry</c:if>
                    <c:if test="${dish.type=='3'}">Drinks</c:if>
                    <c:if test="${dish.type=='4'}">Other</c:if>
                </td>
                <td class="text-center">
                    <a href="javascript:;" dishId="${dish.id}" class="btn btn-danger delDish" >Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="row dishList" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
          <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
        <ul class="pager">
            <c:if test="${pager.pageIndex>1 }">
            <li class="previous delDishPagerBtn"><a pageIndex="${pager.pageIndex-1}" opr="${pager.opr}"
                    href="javascript:;">
                Previous </a></li>
             </c:if>
            <li class="h2">${pager.pageIndex
                    }/${pager.pageCount}</li>
             <c:if test="${pager.pageIndex<pager.pageCount }">
            <li class="next delDishPagerBtn"><a pageIndex="${pager.pageIndex+1}" opr="${pager.opr}"
                    href="javascript:;">
                Next page </a></li>
             </c:if>
        </ul>
        </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
</div>
<script type="text/javascript">
    $(".dishList").fadeIn(200);
</script>