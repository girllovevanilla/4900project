<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="javascript:;" id="updateProviderForm">
    <input type="hidden"
           name="id"
           class="form-control"
           value="${provider.id}"/>
    <div class="input-group">
        <span class="input-group-addon">ProName:</span> <input type="text"
                                                          id="updateproName"
                                                          name="proName"
                                                          class="form-control"
                                                          value="${provider.proName}"
                                                          placeholder="ProName"/>
        <span class="input-group-addon" id="updateProNameError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Product:</span> <input type="text"
                                                            id="updateproduct"
                                                            name="product"
                                                            value="${provider.product}"
                                                            class="form-control"
                                                            placeholder="product"/>
        <span class="input-group-addon" id="updateProductError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Address:</span> <input type="text"
                                                          id="updateaddress"
                                                          name="address"
                                                          value="${provider.address}"
                                                          class="form-control"
                                                          placeholder="Vendor address"/>
        <span class="input-group-addon" id="updateAddressError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Phone Number:</span> <input type="text"
                                                            id="updatetelNumber"
                                                            value="${provider.telNumber}"
                                                            name="telNumber"
                                                            class="form-control"
                                                            placeholder="Phone Number"/>
        <span class="input-group-addon" id="updateTelNumberError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Contact person:</span> <input type="text"
                                                           id="updatecontact"
                                                           name="contact"
                                                           value="${provider.contact}"
                                                           class="form-control"
                                                           placeholder="Contact person"/>
        <span class="input-group-addon" id="updateContactError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Telephone number:</span> <input type="text"
                                                            id="updateproPhone"
                                                            name="phone"
                                                            value="${provider.phone}"
                                                            class="form-control"
                                                            placeholder="Telephone number"/>
        <span class="input-group-addon" id="updateProPhoneError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">Remark:</span> <input type="text"
                                                          id="updateremark"
                                                          name="remark"
                                                          value="${provider.remark}"
                                                          class="form-control"
                                                          placeholder="remark"/>
        <span class="input-group-addon" id="updateRemarkError"></span>
    </div>
    <br>
    <div class="input-group col-lg-12">
        <div class=" col-lg-6">
            <a href="javascript:;" class="btn btn-success" id="updateProviderBtn">Confirm modification</a>
        </div>
        <div class=" col-lg-6 ">
            <button type="button" class="btn btn-warning" id="goBackUpdateProviderBtn">Back</button>
        </div>
    </div>
    <br>
</form>
