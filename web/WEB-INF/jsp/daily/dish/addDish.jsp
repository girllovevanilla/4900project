<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="" id="dishMenu211">
    <p class="text-center h2">Add Dishes</p>
    <form action="javascript:;">
        <br/>
        <div class="input-group">
            <span class="input-group-addon">Dish name:</span> <input type="text" name="dishName"
                                                              id="dishName" class="form-control"
                                                              placeholder="Dish name"/>
            <span id="dishNameError" class="input-group-addon" style="color: red;">${dishNameError}</span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">Price:</span> <input type="number" name="price"
                                                              id="price" class="form-control"
                                                              placeholder="Price"/>
            <span id="priceError" class="input-group-addon" style="color: red;">${priceError}</span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">Type:</span> <select name="type" id="type"
                                                               class="form-control">
            <option selected="selected" value="0" disabled="disabled">Please select</option>
            <option value="1"> Soup </option>
            <option value="2"> Stir-fry </option>
            <option value="3"> Wine </option>
            <option value="4"> Other </option>
        </select>
            <span id="typeError" class="input-group-addon" style="color: red;">${typeError}</span>
        </div>
        <div class="input-group" id="drinkBillInput" style="display: none;">
            <span class="input-group-addon">Select the corresponding wine purchase:</span> <select name="drinkBillCode" id="drinkBillCode"
                                                               class="form-control">

        </select>
            <span id="drinkBillError" class="input-group-addon" style="color: red;"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">Photos:</span> <input type="file" name="file"
                                                              id="upload" class="form-control"
        />
            <span id="fileError" class="input-group-addon" style="color: red;">${fileError}</span>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success" id="addDish">Confirm addition</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning" id="resetDishBtn">Reset</a>
            </div>
        </div>
        <br>
    </form>
</div>
