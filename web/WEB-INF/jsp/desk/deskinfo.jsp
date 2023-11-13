<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Menu management system</title>
</head>

<body>
	<!-- 头文件 -->
	<%@ include file="../command/head.jsp"%>
	<!-- /头文件 -->
	<hr />
	<!-- 桌位信息 -->
	<div class="panel panel-info" id="deskInfo" style="display:none; ">
	<input type="hidden" value="${desk.deskCode }" id="deskCode">
		<div class="panel-heading">
			<p class="text-right">
				<a href="${pageContext.request.contextPath}/desklist.html?show=desk""><span
					class="glyphicon glyphicon-remove-circle"></span></a>
			</p>
			<div class=" row" style="font-size: 16px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-4">
					Desk Code:<span style="font-weight: bold;">${desk.deskCode }</span>&nbsp;&nbsp;&nbsp;State：<span
						style="color:red;" class="deskStatus"><c:if
							test="${desk.status==1 }">Null</c:if> <c:if
							test="${desk.status==2 }">Unpaid bill</c:if></span>
				</div>
				<div class="col-lg-4 ">
					<div class="row">
						<div class="col-lg-3">
							<button class="btn btn-default openDesk" data-toggle="modal"
								data-target="#openDesk"
								style="<c:if test="${desk.status!=1 }">display: none;</c:if>">Open the table</button>
						</div>
						<div class="col-lg-3 setPeopleNum"
							style="<c:if test="${desk.status==1 }">display: none;</c:if>">People Num:</div>
						<div class="col-lg-4 setPeopleNum"
							style="<c:if test="${desk.status==1 }">display: none;</c:if>">
							<input class="form-control " id="setPeopleNum"
								deskId="${desk.id }" type="number" value="${desk.peopleNum }"
								disabled="disabled" />
						</div>
						<div class="col-lg-2"></div>
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
		<div class="panel-body deskInfoBody"
			style="<c:if test="${desk.status==1 }">display: none;</c:if>">
			<table class="table table-hover" id="finalCustormDishes">
				<thead>
					<tr class="info" style="font-size: 16px;font-weight: bold;">
						<td> Dish name </td>
						<td> Unit price </td>
						<td> Number </td>
						<td> Remarks </td>
						<td> Subtotal </td>
						<td> Operation </td>
					</tr>
				</thead>
				<tbody class="deskDish">			
					<c:forEach items="${deskDish }" var="dish">
						<tr class="columnDesk">
							<td class="dishName">${dish.dishName }</td>
							<td class="price">$${dish.price }</td>
							<td class="num">${dish.dishNum}</td>
							<td class="discrip">${dish.content }</td>
							<td class="cost">$${dish.cost }</td>
							<td><button class="btn btn-default updateBtn"
											price="${dish.price }" cost="${dish.cost }"
											content="${dish.content }" 
											dishNum="${dish.dishNum }" dishName="${dish.dishName }">Edit</button>
								<button class="btn btn-default delBtn"  dishName="${dish.dishName }" 
									>Delete</button></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td class="totalMoneyTd"  colspan="6"style="display:<c:if test="${empty deskDish or fn:length(deskDish) eq 0 }">none</c:if>
										;"><h3 id="total" >
							Total: $<span class="totalMoney">${totalMoney }</span>
							</h3></td>
					</tr>
					<tr>
						<td colspan="6">
							<ul class="pager">
								<li class="previous"><a
									href="${pageContext.request.contextPath}/desklist.html?show=desk"
									class="btn btn-default"> Back </a></li>
								<li class="next"><a class="btn btn-warning " id="diancai" style="background-color: #D9534F; color:#FFFFFF;">
									Dishes </a>
									<a class="btn btn-warning "  style="background-color: deepskyblue; color:#FFFFFF;">
										Print out </a>
									<a class="btn btn-default " id="payBtn" data-toggle="modal"
										style="background-color: #5CB85C;color:#FFFFFF;
										display:<c:if test="${empty deskDish or fn:length(deskDish) eq 0 }">none</c:if>
										;"
									data-target="#payDiv"> Settle accounts </a></li>
							</ul>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<!-- /桌位信息 -->

	<!-- Order dishes -->
	<div id="selectDishes" style="display: none;">
		<!-- 菜单 -->
		<div class="col-xs-5 panel panel-info" style="height:750px;">
			<div class="panel-body">
				<ul class="nav nav-tabs ">
					<li class="active"><a href="#all" data-toggle="tab">All</a></li>
					<li><a href="#soup" data-toggle="tab">Soup</a></li>
					<li><a href="#fry" data-toggle="tab">Fry</a></li>
					<li><a href="#drink" data-toggle="tab">Drink</a></li>
					<li><a href="#other" data-toggle="tab">Other</a></li>
				</ul>
				<div class="tab-content dishMenuBody">
					<div class=" tab-pane fade active in" id="all">

					</div>
					<div class="tab-pane fade" id="fry">

					</div>
					<div class="tab-pane fade" id="soup">

					</div>
					<div class="tab-pane fade" id="drink">

					</div>
					<div class="tab-pane fade" id="other">

					</div>
				</div>
			</div>
		</div>
		<!--/ 菜单 -->
		<!-- 桌位信息 -->
		<div class="col-xs-7">
			<div class="panel panel-info" style="height:750px;">
				<div class="panel-heading">
					<span class="h3 text-left">Desk Code:${desk.deskCode }</span>
				</div>
				<div class="panel-body">
					<table class="table table-hover " id="custormDishes">
						<thead>
							<tr class="info">
								<td class="h3">Dish name</td>
								<td class="h3">Unit price</td>
								<td class="h3">Number</td>
								<td class="h3">Remarks</td>
								<td class="h3">Subtotal</td>
								<td class="h3">Operation</td>
							</tr>
						</thead>
						<tbody class="deskDish">
							<c:forEach items="${deskDish }" var="dish">
								<tr class="columnDesk">
									<td class="dishName">${dish.dishName }</td>
									<td class="price">$${dish.price }</td>
									<td class="num">${dish.dishNum}</td>
									<td class="discrip">${dish.content }</td>
									<td class="cost">$${dish.cost }</td>
									<td><button class="btn btn-default updateBtn"
											price="${dish.price }" cost="${dish.cost }"
											content="${dish.content }" 
											dishNum="${dish.dishNum }" dishName="${dish.dishName }">Edit</button>
										<button class="btn btn-default delBtn" dishName="${dish.dishName }" >删除</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td class="totalMoneyTd" colspan="6" style="display:<c:if test="${empty deskDish or fn:length(deskDish) eq 0 }">none</c:if>
										;"><h3 >
										Total:$<span class="totalMoney">${totalMoney }</span>
									</h3></td>
							</tr>
							<tr>
								<td colspan="6">
									<ul class="pager">
										<li class="previous backDeskInfo"><a href="javascript:;"
											class="btn btn-default submitDish"> Back </a></li>
										<li class="next sureDeskInfo"><a href="javascript:;"
											class="btn btn-default  submitDish"
											deskStatus=${desk.status } deskId="${desk.id }"> Submit </a></li>
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div></div>

				<!-- /桌位信息 -->
			</div>
		</div>
	</div>
	<!--/ Order dishes -->


	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<!-- /尾文件 -->

	<!-- 弹框模块 -->

	<!-- Order dishes弹框 -->
	<div class="modal fade" id="selectDish" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="	">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<br /> <br />
					<p class="modal-title h1 text-center " id="myModalLabel">Order dishes</p>
					<br /> <br />
					<table class="table table-hover">
						<thead>
							<tr>
								<td class="h3 col-xs-2">Dish name</td>
								<td class="h3 col-xs-2">Unit price</td>
								<td class="h3 col-xs-2">Number</td>
								<td class="h3 col-xs-2">Remarks</td>
								<td class="h3 col-xs-2">Subtotal</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-xs-2 "><span class="showDishName"
									style="color:red;"></span></td>
								<td class="col-xs-2 ">$<span class="showDishPrice"></span></td>
								<td class="col-xs-2">
									<div class="form-group col-xs-8">
										<input class="form-control  dishNum" type="number" value="1" />
									</div>
									<div class="col-xs-2"></div>
								</td>
								<input type="hidden" id="drinkBillCode" name="drinkBillCode" />
								<td class="col-xs-2">
									<div class="form-group col-xs-8">
										<input class="form-control " id="dishContent" type="text"
											placeholder="Remarks" />
									</div>
									<div class="col-xs-2"></div>
								</td>
								<td class="col-xs-2 ">$<span class="showDishCotst"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br /> <br /> <br /> <br />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary  sureDishBtn"
						deskCode="${desk.deskCode }" data-dismiss="modal">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Order dishes弹框 -->

	<!-- Edit弹框 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="	">
			<div class="modal-content">
				<div class="modal-footer">
						<p class="modal-title h1 text-center" id="myModalLabel">Edit</p>
						<br/><br/>
						<table class="table">
							<thead>
								<tr>
									<td class="h3 col-xs-2">Dish name</td>
									<td class="h3 col-xs-2">Unit price</td>
									<td class="h3 col-xs-2">Number</td>
									<td class="h3 col-xs-2">Remarks</td>
									<td class="h3 col-xs-2">Subtotal</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="col-xs-2"><span class="upName"></span></td>
									<td class="col-xs-2">$<span class="upPrice"></span></td>
									<td class="col-xs-2">
										<div class="form-group col-xs-8">
											<input class="form-control  upDishNum" id="upDishNum" type="number" />
										</div>
										<div class="col-xs-2"></div>
									</td>
									<td class="col-xs-2">
										<div class="form-group col-xs-8">
											<input class="form-control  upContent" id="" type="text"
												placeholder="Remarks" />
										</div>
										<div class="col-xs-2"></div>
									</td>
									<td class="col-xs-2">$<span class="upCost"></span></td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary updateDishSureBtn">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<!--/ Edit弹框 -->

	<!-- Settle accounts弹框 -->
	<div class="modal fade" id="payDiv" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="	">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<p class="modal-title h1 text-center" id="myModalLabel">Settle accounts</p>
				</div>
				<div class="modal-body col-xs-12">
					<div class="col-xs-2"></div>
					<div class="panel  col-xs-8">
						<div class="panel-body">
							<form class="form-horizontal">
								<div class="form-group">
									<label for="" class="control-label">Payment method:</label> <label
										class="radio-inline"> <input type="radio"
										name="payType" id="wePay" value="1" class="payType">
									Wechat
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="aliPay" value="2">
									Alipay
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="bankCard" value="3">
									Swipe card
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="cash" value="4"> Cash
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="debtor" value="5">
									On account
									</label>
								</div>
								<div class="form-group">
									<label for="" class="control-label">Whether you are a member:</label> <label
										class="radio-inline"> <input type="radio" name="isVIP"
										id="VIP" value="1" class="isVIP"> Yes
									</label> <label class="radio-inline"> <input type="radio"
										class="isVIP" name="isVIP" id="notVIP" value="2" checked>
										No
									</label>
								</div>
								<div class="form-group has-success">
									<!-- <label for="" class="control-label">自定义折扣：</label> <input
													class="form-control " id="" type="text" disabled="disabled" /> -->
									<div class="input-group has-success">
										<span class="input-group-addon  "> Custom discount <input
											type="checkbox" class="myselfDiscount  myselfDiscountBtn">
										</span> <input type="number" placeholder="Please enter an integer ranging from 1 to 10" min="0.0"
											step="0.5" max="10.0"
											class="form-control  myselfDiscountInput" disabled="disabled">
									</div>
									<!-- /input-group -->
								</div>
								<div class="form-group has-success">
									<div class="input-group has-success">
										<span class="input-group-addon "> On account </span> <input
											type="text" class="form-control debtorInput"
											disabled="disabled">
									</div>
									<!-- /input-group -->
								</div>
							</form>
						</div>
						<h4 class="row">
							<div class="col-lg-6">
								Total：$<span class="totalMoney" id="totalMoney">${totalMoney
									}</span>
							</div>
							<div class="col-lg-6">
								After folding:$<span class="afterDiscount">${totalMoney }</span>
							</div>
						</h4>
					</div>
				</div>
				<div class="modal-footer">
					<a
						href="${pageContext.request.contextPath }/deskinfo.html?show=desk&id=${param.id}"
						class="btn btn-default" data-dismiss="modal">Close</a>
					<button type="button" class="btn btn-primary" id="pay" discount=""
						payType="" deskId="${desk.id }" deskCode="${desk.deskCode }" peopleNum="${desk.peopleNum}">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Settle accounts弹框 -->

	<!-- 删除弹框 -->
	<div class="modal fade" id="deleteDish" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-xs" role="	">
			<div class="modal-content">
				<div class="modal-body col-xs-12">
					<div class="text-center">
						<p class="h2">Confirm delete?</p>
						<P></P>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary sureDelBtn">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 删除弹框 -->

	<!-- 开桌弹框 -->
	<div class="modal fade" id="openDesk" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-xs" role="	">
			<div class="modal-content">
				<div class="modal-body col-xs-12">
					<div class="text-center">
						<p class="h2">Set a table</p>
						<div class="input-group">
							<span class="input-group-addon">Number of people</span> <input
								class="form-control " id="openDeskPeopleNum" type="number" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary openDeskSure"
						deskId="${desk.id }">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /开桌弹框 -->

	<!--/ 弹框模块 -->




	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/deskinfo.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/myjs.js"></script>
</body>
</html>