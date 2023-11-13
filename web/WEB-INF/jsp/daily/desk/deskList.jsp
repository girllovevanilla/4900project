<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<table class="table table-striped table-bordered dailyDeskList"  style="display: none;">
    <thead>
    <tr>
        <th class="text-center">Serial number</th>
        <th class="text-center">Desk Code</th>
        <th class="text-center">Option</th>
    </tr>
    </thead>
    <tbody>
     <c:forEach items="${pager.list}" var="desk" varStatus="sta">
    <tr>
        <td class="text-center">${sta.count}</td>
        <td class="text-center">${desk.deskCode}</td>
        <td class="text-center">
            <a href="javascript:;"  deskId="${desk.id}"  class="btn btn-danger delDesk">Delete</a>
            <a href="javascript:;" deskId="${desk.id}" deskCode="${desk.deskCode}" class="btn btn-success alterDesk">Edit</a>
        </td>
    </tr>
     </c:forEach>
    </tbody>
</table>
<div class="row dailyDeskList" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
         <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
        <ul class="pager">
             <c:if test="${pager.pageIndex>1 }">
            <li class="previous dailyDeskPagerBtn"><a pageIndex="${pager.pageIndex-1}"
                                                      serchDeskCode="${pager.serchDeskCode}"
                                                      href="javascript:;">
                Previous </a></li>
               </c:if>
            <li class="h2">${pager.pageIndex
                    }/${pager.pageCount}</li>
             <c:if test="${pager.pageIndex<pager.pageCount }">
            <li class="next dailyDeskPagerBtn"><a pageIndex="${pager.pageIndex+1}"
                                                  serchDeskCode="${pager.serchDeskCode}"
                                                  href="javascript:;">
                Next page </a></li>
             </c:if>
        </ul>
          </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
<script type="text/javascript">
    $(".dailyDeskList").fadeIn(200);
</script>