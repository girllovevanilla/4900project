<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <p class="modal-title h1 text-center " id="myModalLabel">Add purchase information</p>
        </div>
        <form action="">
            <div class="modal-body col-lg-12">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Product Name<span id="productNameError" style="color:red;"></span></th>
                        <th>Product Number<span id="proCountError" style="color:red;"></span></th>
                        <th>Unit<span id="unitError" style="color:red;"></span></th>
                        <th>Commodity purchase price<span id="priceError" style="color:red;"></span></th>
                        <th>Gross commodity price<span id="totalCostError" style="color:red;"></span></th>
                        <th>Supplier<span id="providerIdError" style="color:red;"></span></th>
                        <th>Entry person's name<span id="createByError" style="color:red;"></span></th>
                        <th>Whether to pay or not<span id="isPayError" style="color:red;"></span></th>
                        <th>Remark<span id="remarkError" style="color:red;"></span></th>
                        <th>Selling price<span id="sellPriceError" style="color:red;"></span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center"><input type="text" class="form-control"
                                                       id="addProductName"
                                                       name="productName"  placeholder="Product Name"/></td>
                        <td class="text-center"><input type="number" class="form-control" min="1"
                                                       id="addProCount"
                                                       name="count"  placeholder="Product Number"/></td>
                        <td class="text-center"><input type="text" class="form-control" min="1"
                                                       id="addUnit"
                                                       name="count" value="" placeholder="Unit"/></td>
                        <td class="text-center"><input type="text" class="form-control"
                                                       id="addPrice"
                                                       name="PCSalePrice" value="" placeholder="Commodity purchase price(单价)"/></td>
                        <td class="text-center"><input type="text" class="form-control" name="price"
                                                       id="addTotalCost"
                                                       value="" placeholder="Gross commodity price"/></td>
                        <td class="text-center">
                            <div class="input-group">
                                <select type="text" id="addProviderId" class="form-control providerSlecteDiv">
                                </select>
                            </div>
                        </td>
                        <td class="text-center"><input type="text" class="form-control" name="name"
                                                       id="addCreateBy"
                                                       value="" placeholder="Entry person's name"/></td>
                        <td class="text-center">
                            <div class="input-group">
                                <select type="text" id="addIsPay" class="form-control">
                                    <option value="0">Please select</option>
                                    <option value="2">Paid</option>
                                    <option value="1">Not paying</option>
                                </select>
                            </div>
                        </td>
                        <td class="text-center"><input type="text" class="form-control"
                                                       id="addRemark"
                                                       placeholder="Remark"/></td>
                        <td class="text-center"><input type="number" class="form-control"
                                                       id="addSellPrice"
                                                       placeholder="Selling price"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <input type="button" id="addDrinkBillBtn" name="submit" class="btn btn-primary"
                       value="Submit"/>
            </div>
        </form>
    </div>
</div>
