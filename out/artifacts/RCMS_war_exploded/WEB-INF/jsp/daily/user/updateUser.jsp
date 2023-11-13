<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form  id="updateUserForm">
        <p class="text-center h2">Edit User</p>
        <div class="input-group">
            <span class="input-group-addon">userCode:</span> <input disabled="disabled"
                                                              name="userCode"
                                                              type="text"
                                                              class="form-control"
                                                              value="${user.userCode}"
                                                              placeholder="userCode"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">userName:</span> <input type="text"
                                                              name="userName"
                                                              class="form-control"
                                                              value="${user.userName}"
                                                              placeholder="userName"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">userPassWord:</span> <input type="text"
                                                              name="userPassWord"
                                                              class="form-control"
                                                              value="${user.userPassWord}"
                                                              placeholder="userPassWord"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">Phone:</span> <input type="text"
                                                              class="form-control"
                                                              name="phone"
                                                              value="${user.phone}"
                                                              placeholder="phone"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">Identity:</span> <input type="text"
                                                               class="form-control"
                                                               name="identity"
                                                               value="${user.identity}"
                                                               placeholder="identity"/>
            <input type="hidden"
                   name="id"
                   value="${user.id}"/>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success sureUpdateBtn">Confirm Modification</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning backUserListBtn" >Back</a>
            </div>
        </div>
        <br>
    </form>
