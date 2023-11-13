$(function () {
    var path=$("#path").attr("path");
    //ajax加载供应商下拉列表
    function loadProviderSelect() {
        $.ajax({
            url: path+"/loadProviderSelect.do",
            dataType: "json",
            type: "post",
            success: function (data) {
                var str = "<option value='0' selected='selected' >Please select</option>";
                for (var i = 0; i < data.length; i++) {
                    str += "<option value='" + data[i].id + "' " +
                        "providerId='" + data[i].id + "'>" + data[i].proName + "</option>"
                }
                $(".providerSlecteDiv").html(str);
            },
            error: function () {
                alert("Communication exception");
            }
        });
    }

    //加载供应商下拉列表
    loadProviderSelect();
    //参数
    var param = {};

    function getParam(providerId, productName, pageIndex) {
        param.providerId = providerId;
        param.productName = productName;
        param.pageIndex = pageIndex;
    }

    getParam(0, null, 1);
    loadDrinkBill(param);
    //翻页
    $("#today").on("click", ".drinkBillPagerBtn", function (e) {
        var pageIndex = $(e.target).attr("pageIndex");
        var productName = $(e.target).attr("productName");
        var providerId = $(e.target).attr("providerId");
        getParam(providerId, productName, pageIndex);
        loadDrinkBill(param);
    })
    //动态搜索
    $("#today").on("click", "#serchDrinkBillBtn", function (e) {
        var productName = $("#productName").val();
        var providerId = $("#providerId").val();
        getParam(providerId, productName, 1);
        loadDrinkBill(param);
    })
    $("#shengyu").on("click", "#serchDrinkSuplusBillBtn", function (e){
        var productName = $("#suplusProductName").val();
        var providerId = $("#suplusProviderId").val();
        getParam(providerId, productName, 1);
        loadSuplusDrinkBill(param);
    })
    getParam(0, null, 1);
    loadSuplusDrinkBill(param);
    //ajax加载进货信息
    function loadSuplusDrinkBill(param) {
        $.ajax({
            url: path+"/loadSuplusDrinkBill.do",
            dataType: "html",
            type: "post",
            data: param,
            success: function (data) {
                $("#ajaxSuplusListAppendDiv").html(data);
            },
            error: function () {
                alert("Communication exception");
            }
        });
    }
    //ajax加载进货信息
    function loadDrinkBill(param) {
        $.ajax({
            url: path+"/loadDrinkBill.do",
            dataType: "html",
            type: "post",
            data: param,
            success: function (data) {
                $("#ajaxJinhuoListAppendDiv").html(data);
            },
            error: function () {
                alert("Communication exception");
            }
        });
    }
    $("#showSellDivBtn").click(function () {
        getParam(0, null, 1);
        loadDrinkSellBill(param);
    });
    getParam(0, null, 1);
    loadDrinkSellBill(param);
    function loadDrinkSellBill(param) {
        $.ajax({
            url: path+"/loadDrinkSellBill.do",
            dataType: "html",
            type: "post",
            data: param,
            success: function (data) {
                $("#ajaxSellListAppendDiv").html(data);
            },
            error: function () {
                alert("Communication exception");
            }
        });
    }
    //销售信息翻页
    $("#ajaxSellListAppendDiv").on("click",".drinkSellBillPagerBtn",function (e) {
        var pageIndex = $(e.target).attr("pageIndex");
        var productName = $(e.target).attr("productName");
        var providerId = $(e.target).attr("providerId");
        getParam(providerId, productName, pageIndex);
        loadDrinkSellBill(param);
    })
    //销售信息翻页
    $("#ajaxSuplusListAppendDiv").on("click",".suplusDrinkBillPagerBtn",function (e) {
        var pageIndex = $(e.target).attr("pageIndex");
        var productName = $(e.target).attr("productName");
        var providerId = $(e.target).attr("providerId");
        getParam(providerId, productName, pageIndex);
        loadSuplusDrinkBill(param);
    })
    //销售信息动态搜索
    $("#xiaoshou").on("click", "#serchDrinkSellBillBtn", function (e) {
        var productName = $("#sellProductName").val();
        var providerId = $("#sellProviderId").val();
        getParam(providerId, productName, 1);
        loadDrinkSellBill(param);
    })
    //删除进货信息
    $("#today").on("click", ".delDrinkBill", function (e) {
        if (confirm("Are you sure to delete?")) {
            var drinkBillId = $(e.target).attr("drinkBillId");
            $.ajax({
                url: path+"/delDrinkBill.do",
                dataType: "json",
                data: {"id": drinkBillId},
                success: function (data) {
                    alert("Deleted successfully!");
                    getParam(0, null, 1);
                    loadDrinkBill(param);
                    loadDrinkSellBill(param);
                },
                error: function () {
                    alert("Communication exception");
                }
            });
        }
    })
    //删除销售信息
    $("#xiaoshou").on("click",".delDrinkSellBill",function(e){
        if (confirm("Are you sure to delete?")) {
            var drinkSellBillId = $(e.target).attr("drinkSellBillId");
            $.ajax({
                url: path+"/delDrinkSellBill.do",
                dataType: "json",
                data: {"id": drinkSellBillId},
                success: function (data) {
                    alert("Deleted successfully!");
                    getParam(0, null, 1);
                    loadDrinkSellBill(param);
                },
                error: function () {
                    alert("Communication exception");
                }
            });
        }
    })
    //更新进货信息
    $("#today").on("click", ".updateDrinkBill", function (e) {
        if (confirm("Confirm payment?")) {
            var drinkBillId = $(e.target).attr("drinkBillId");
            $.ajax({
                url: path+"/updateDrinkBill.do",
                dataType: "json",
                data: {"id": drinkBillId},
                success: function (data) {
                    alert("Payment is successful!");
                    getParam(0, null, 1);
                    loadDrinkBill(param);
                },
                error: function () {
                    alert("Communication exception");
                }
            });
        }
    });


    //productName\proCount\unit\price\totalCost\providerId\createBy\isPay\remark\addSellPrice
    //弹出添加模块
    $(".showAddDrinkModal").click(function(){
        $("#addDrinkBillModal").modal("show");
    });
    var productNameFlag=false;
    var proCountFlag=false;
    var unitFlag=false;
    var priceFlag=false;
    var totalCostFlag=false;
    var providerIdFlag=false;
    var createByFlag=false;
    var isPayFlag=false;
    var sellPriceFlag=false;
    var addFlag=false;
    function canAdd(){
        if(sellPriceFlag&&productNameFlag&&proCountFlag&&unitFlag&&priceFlag&&totalCostFlag&&providerIdFlag&&createByFlag&&isPayFlag){
            addFlag=true;
        }else{
            addFlag=false;
        }
    }
    //商品名为空判断
    function sellPriceValidity(sellPrice){
        if(sellPrice==null || sellPrice==""){
            $("#sellPriceError").text("Cannot be empty");
            sellPriceFlag=false;
        }else if(sellPrice<=0){
            $("#sellPriceError").text("Please enter the correct number");
            sellPriceFlag=false;
        }else{
            $("#sellPriceError").text("");
            sellPriceFlag=true;
        }
    }
    function createByValidity(createBy){
        if(createBy==null || createBy==""){
            $("#createByError").text("Please select");
            createByFlag=false;
        }else{
            $("#createByError").text("");
            createByFlag=true;
        }
    }
    function isPayValidity(isPay){
        if(isPay==null || isPay=="" || isPay==0 || isPay=="0"){
            $("#isPayError").text("Please select");
            isPayFlag=false;
        }else{
            $("#isPayError").text("");
            isPayFlag=true;
        }
    }
    function providerIdValidity(providerId){
        if(providerId==null || providerId=="" || providerId==0 || providerId=="0"){
            $("#providerIdError").text("Please select");
            providerIdFlag=false;
        }else{
            $("#providerIdError").text("");
            providerIdFlag=true;
        }
    }
    function totalCostValidity(totalCost){
        if(totalCost==null || totalCost==""){
            $("#totalCostError").text("Cannot be empty");
            totalCostFlag=false;
        }else if(totalCost<=0){
            $("#totalCostError").text("Please enter the correct number");
            totalCostFlag=false;
        }else{
            $("#totalCostError").text("");
            totalCostFlag=true;
        }
    }
    function priceValidity(price){
        if(price==null || price==""){
            $("#priceError").text("Cannot be empty");
            priceFlag=false;
        }else if(price<=0){
            $("#priceError").text("Please enter the correct number");
            priceFlag=false;
        }else{
            $("#priceError").text("");
            priceFlag=true;
        }
    }
    function productNameValidity(productName){
        if(productName==null || productName==""){
            $("#productNameError").text("Cannot be empty");
            productNameFlag=false;
        }else{
            $("#productNameError").text("");
            productNameFlag=true;
        }
    }
    function unitValidity(unit){
        if(unit==null || unit==""){
            $("#unitError").text("Cannot be empty");
            unitFlag=false;
        }else{
            $("#unitError").text("");
            unitFlag=true;
        }
    }
    function proCountValidity(proCount){
        if(proCount==null || proCount==""){
            $("#proCountError").text("Cannot be empty");
            proCountFlag=false;
        }else if(proCount<=0){
            $("#proCountError").text("Please enter the correct number");
            proCountFlag=false;
        }else{
            $("#proCountError").text("");
            proCountFlag=true;
        }
    }
    $("#addProductName").blur(function(){
        productNameValidity($(this).val());
    });
    $("#addTotalCost").blur(function(){
        totalCostValidity($(this).val());
    });
    $("#addProviderId").blur(function(){
        providerIdValidity($(this).val());
    });
    $("#addIsPay").blur(function(){
        isPayValidity($(this).val());
    });
    $("#addCreateBy").blur(function(){
        createByValidity($(this).val());
    });
    $("#addSellPrice").blur(function(){
        sellPriceValidity($(this).val());
    });
    $("#addPrice").blur(function(){
        priceValidity($(this).val());
    });
    $("#addUnit").blur(function(){
        unitValidity($(this).val());
    });
    $("#addProCount").blur(function(){
        proCountValidity($(this).val());
    });

    //添加按钮
    $("#addDrinkBillBtn").click(function(){
        var param={};
        var productName=$("#addProductName").val();
        param.productName=productName;
        var proCount=$("#addProCount").val();
        param.proCount=proCount;
        var unit=$("#addUnit").val();
        param.unit=unit;
        var price=$("#addPrice").val();
        param.price=price;
        var createBy=$("#addCreateBy").val();
        param.createBy=createBy;
        var isPay=$("#addIsPay").val();
        param.isPay=isPay;
        var providerId=$("#addProviderId").val();
        param.providerId=providerId;
        var totalCost=$("#addTotalCost").val();
        param.totalCost=totalCost;
        var remark=$("#addRemark").val();
        param.remark=remark;
        var sellPrice=$("#addSellPrice").val();
        param.sellPrice=sellPrice;
        sellPriceValidity(sellPrice);
        productNameValidity(productName);
        createByValidity(createBy);
        isPayValidity(isPay);
        providerIdValidity(providerId);
        totalCostValidity(totalCost);
        priceValidity(price);
        unitValidity(unit);
        proCountValidity(proCount);
        canAdd();

        if(addFlag){
            if(confirm("Are you sure?")){
                $.ajax({
                    url:path+"/addDrinkBill.do",
                    type:"post",
                    dataType:"json",
                    data:param,
                    success:function (data) {
                        if(data.addDrinkBillFlag==0 ||data.addDrinkBillFlag=="0"){
                            alert("Failed to add purchase information!");
                        }else{
                            alert("Add purchase information successfully!");
                        }
                        if(data.addDrinkSellBillFlag==0 ||data.addDrinkSellBillFlag=="0"){
                            alert("Failed to add sales information!");
                        }else{
                            alert("Add sales information successfully!");
                        }
                        $("#addDrinkBillModal").modal("hide");
                        window.location.href=path+"/drink.html?show=drink";
                    },
                    error:function () {
                        alert("Communication exception");
                    }
                });
            }
        }
    });


    //


});