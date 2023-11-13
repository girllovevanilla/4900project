<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-12 col-md-12 " >
    <br/>
    <div class="table-responsive ">
        <div class="row">
            <div class="col-lg-3">
                <div class="input-group">
                    <span
                            class="input-group-addon ">Supplier</span><select type="text" id="providerId" name="providerId"
                                                                         class="form-control providerSlecteDiv">
                </select>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="input-group">
                     <span
                             class="input-group-addon">Product Name</span><input type="text" id="productName" name="productName" class="form-control"/>
                </div>
            </div>
            <div class="col-lg-3">
                <button class="btn btn-default" id="serchDrinkBillBtn">Query</button>
            </div>
            <div class="tsx">
                <a class="btn btn-default showAddDrinkModal" > Add </a>
            </div>
        </div>
        <br/>
        <%--   <div class=" col-md-10 col-sm-8 col-xs-6  "></div>--%>
        <div id="ajaxJinhuoListAppendDiv">

        </div>

    </div>
</div>
