<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="">
    <p class="text-center h2">Add Desk</p>
    <div class="input-group">
        <span class="input-group-addon">Desk Code:</span> <input type="text" id="deskCode"
                                                          name="deskCode"
                                                          class="form-control"
                                                          placeholder="Desk Code"/>
        <span class="input-group-addon" id="addDeskError"></span>
    </div>
    <br/>
    <br/>
    <div class="input-group col-lg-12">
        <div class=" col-lg-6">
            <a href="javascript:;" class="btn btn-success" id="addDeskBtn">Confirm Addition</a>
        </div>
        <div class=" col-lg-6 ">
            <a href="javascript:;" class="btn btn-warning" id="resetDeskBtn">Reset</a>
        </div>
    </div>
    <br/>

