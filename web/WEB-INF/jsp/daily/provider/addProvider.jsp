<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="javascript:;" id="addProviderForm">
    <div class="input-group">
        <span class="input-group-addon">Pro Name:</span> <input type="text"
                                                          id="proName"
                                                          name="proName"
                                                          class="form-control"
                                                          placeholder="proName"/>
        <span class="input-group-addon" id="addProNameError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Product:</span> <input type="text"
                                                          id="product"
                                                          name="product"
                                                          class="form-control"
                                                          placeholder="product"/>
        <span class="input-group-addon" id="addProductError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Address:</span> <input type="text"
                                                          id="address"
                                                          name="address"
                                                          class="form-control"
                                                          placeholder="Vendor address"/>
        <span class="input-group-addon" id="addAddressError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Phone Number:</span> <input type="text"
                                                            id="telNumber"
                                                            name="telNumber"
                                                            class="form-control"
                                                            placeholder="Phone Number"/>
        <span class="input-group-addon" id="addTelNumberError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Contact person:</span> <input type="text"
                                                          id="contact"
                                                          name="contact"
                                                          class="form-control"
                                                          placeholder="Contact person"/>
        <span class="input-group-addon" id="addContactError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Phone Number:</span> <input type="text"
                                                           id="proPhone"
                                                           name="phone"
                                                           class="form-control"
                                                           placeholder="Phone Number"/>
        <span class="input-group-addon" id="addProPhoneError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Remark:</span> <input type="text"
                                                           id="remark"
                                                           name="remark"
                                                           class="form-control"
                                                           placeholder="remark"/>
        <span class="input-group-addon" id="addRemarkError"></span>
    </div>
    <br>
    <div class="input-group col-lg-12">
        <div class=" col-lg-6">
            <a href="javascript:;" class="btn btn-success" id="addGongying">Confirm Addition</a>
        </div>
        <div class=" col-lg-6 ">
            <button type="reset" class="btn btn-warning" id="resetAddProviderFormBtn">Reset</button>
        </div>
    </div>
    <br>
</form>