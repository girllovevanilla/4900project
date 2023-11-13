<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form action="">
        <p class="text-center h2">Add User</p>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>userCode:</span> <input type="text"
                                                              name="userCode"
                                                              id="userCode"
                                                              class="form-control"
                                                              placeholder="userCode"/>
            <span class="input-group-addon" id="addUserCodeError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>userName:</span> <input type="text"
                                                              name="userName"
                                                              id="userName"
                                                              class="form-control"
                                                              placeholder="userName"/>
            <span class="input-group-addon" id="addUserNameError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>userPassWord:</span> <input type="text"
                                                              name="userPassWord"
                                                              id="userPassWord"
                                                              class="form-control"
                                                              placeholder="userPassWord"/>
            <span class="input-group-addon" id="addUserPassWordError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>Phone:</span> <input type="text"
                                                              name="phone"
                                                              id="phone"
                                                              class="form-control"
                                                              placeholder="phone"/>
            <span class="input-group-addon" id="addUserPhoneError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>Identity:</span> <input type="text"
                                                               name="identity"
                                                               id="identity"
                                                               class="form-control"
                                                               placeholder="identity"/>
            <span class="input-group-addon" id="addUserIdentityError"></span>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success" id="addUser">Confirm Addition</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning" id="resetAddUser">Reset</a>
            </div>
        </div>
        <br>
    </form>
