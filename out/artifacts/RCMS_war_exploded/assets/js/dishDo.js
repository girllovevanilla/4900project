$(function () {
    var submitFlag = false;
    var imgFlag = false;
    var dishNameFlag = false;
    var priceFlag = false;
    var typeFlag = false;
    var path = $("#path").attr("path");
    $("#addDish").click(function () {
        var imgurl = document.getElementById("upload").value;
        var drinkBillCode=$("#drinkBillCode").val();
        if (imgurl == "" || imgurl == null) {
            $("#fileError").css("color", "red");
            $("#fileError").text("Please select file");
        } else {
            $("#fileError").css("color", "green");
            $("#fileError").text("√");
            imgFlag = true;
        }
        var dishName = document.getElementById("dishName").value;
        if (dishName == "" || dishName == null) {
            $("#dishNameError").css("color", "red");
            $("#dishNameError").text("Please enter the name of the dish")
        } else {
            $("#dishNameError").css("color", "green");
            $("#dishNameError").text("√");
            dishNameFlag = true;
        }
        var price = document.getElementById("price").value;
        if (price == "" || price == null) {
            $("#priceError").css("color", "red");
            $("#priceError").text("Please enter unit price")
        } else if (price <= 0) {
            $("#priceError").css("color", "red");
            $("#priceError").text("Please enter the correct unit price")
        } else {
            $("#priceError").css("color", "green");
            $("#priceError").text("√");
            priceFlag = true;
        }
        var type = document.getElementById("type").value;
        if (type == "" || type == null || type == 0) {
            $("#typeError").css("color", "red");
            $("#typeError").text("Please select a type")
        } else {
            $("#typeError").css("color", "green");
            $("#typeError").text("√");
            typeFlag = true;
        }
        if (imgFlag == true && dishNameFlag == true && typeFlag == true && priceFlag == true) {
            submitFlag = true;
        }
        if (submitFlag) {//验证成功，执行ajax请求
            $.ajaxFileUpload({
                url: path + "/addDish.do",
                fileElementId: "upload", //文件上传域的ID，这里是input的ID，而不是img的
                dataType: "json", //返回值类型 一般设置为json
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {"dishName": dishName, "price": price, "type": type,"drinkBillCode":drinkBillCode},
                success: function (data) {
                    if (data == "OK") {
                        alert("Add successfully!");
                        window.location.href = path + "/daily.html?show=daily";
                    } else {
                        $("#fileError").css("color", "red");
                        $("#fileError").text(data.fifleFlag);
                    }
                },
                error: function () {
                    alert("Error!");
                }
            });
        }
    });
    $("#price").change(function () {
        var price=$(this).val();
        if (price == "" || price == null) {
            $("#priceError").css("color", "red");
            $("#priceError").text("Please enter unit price")
        } else if (price <= 0) {
            $("#priceError").css("color", "red");
            $("#priceError").text("Please enter the correct unit price")
        } else {
            $("#priceError").css("color", "green");
            $("#priceError").text("√");
            priceFlag = true;
        }
    });

    function loadDrinkBill(){
        $.ajax({
            url:path+"/loadDrinkBillCode.do",
            data:{"pageIndex":1},
            dataType:"json",
            success:function (data) {
                var str="<option selected=\"selected\" value=\"0\" disabled=\"disabled\">请选择</option>";
                for (var i=0;i<data.length;i++){
                    str+="<option  value=\""+data[i].drinbillCode+"\" >"+data[i].productName+"</option>"
                }
                $("#drinkBillCode").html(str);
            },
            error:function () {
                alert("Load failure");
            }
        });
    }

    $("#type").change(function () {
        var type=$(this).val();
        if(type==3||type=="3"){
            loadDrinkBill();
            $("#drinkBillInput").fadeIn(200);
        }else{
            $("#drinkBillInput").fadeOut(200);
        }
        if (type == "" || type == null) {
            $("#typeError").css("color", "red");
            $("#typeError").text("Please enter unit price")
        } else if (price <= 0) {
            $("#typeError").css("color", "red");
            $("#typeError").text("Please enter the correct unit price")
        } else {
            $("#typeError").css("color", "green");
            $("#typeError").text("√");
            priceFlag = true;
        }
    });
    $("#dishName").change(function () {
        var dishName = $(this).val();
        $.ajax({
            url: path + "/dishNameIsExist.do",
            data: {"dishName": dishName},
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data == 0 || data == "0") {
                    dishNameFlag = false;
                    $("#dishNameError").text("The dish already exists");
                } else {
                    dishNameFlag = true;
                    $("#dishNameError").css("color", "green");
                    $("#dishNameError").text("√");
                }
            },
            error: function (data) {
                alert("NO" + data);
            }
        });
    });


    //显示所有菜品searchDishResult
    $("#showDelBtn").click(function () {
        $.ajax({
            url: path + "/dishList.do",
            data: {"opr": "allDish"},
            dataType: "html",
            success: function (data) {
                $("#searchDishResult").html(data);
            },
            error:function () {
                alert("Load failure");
            }
        });
    });

    //翻页
    $("#searchDishResult").on("click",".delDishPagerBtn",function (e) {
        var pageIndex=$(e.target).attr("pageIndex");
        var opr=$(e.target).attr("opr");
        $.ajax({
            url: path + "/dishList.do",
            data: {"opr": opr,"pageIndex":pageIndex},
            dataType: "html",
            success: function (data) {
                $("#searchDishResult").html(data);
            },
            error:function () {
                alert("Load failure");
            }
        });
    });

    //查找菜品
    $("#searchDish").click(function(){
        var dishName=$("#serchDishName").val();
        $.ajax({
            url: path + "/dishList.do",
            data: {"opr": "serchDish","dishName":dishName},
            dataType: "html",
            type:"post",
            success: function (data) {
                $("#searchDishResult").html(data);
            },
            error:function () {
                alert("Load failure");
            }
        });
    });
    //删除菜品
    $("#searchDishResult").on("click",".delDish",function(e){
        var id=$(e.target).attr("dishId");
        if(confirm("Are you sure to delete?")){
            $.ajax({
                url: path + "/delDishFromMenu.do",
                data: {"id": id},
                dataType: "json",
                type:"post",
                success: function (data) {
                    if(data==1 || data =="1"){
                        alert("Deletion failure");
                    }else{
                        alert("Deletion success");
                        $(e.target).parent().parent().remove();
                    }
                },
                error:function () {
                    alert("Load failure");
                }
            });
        }
    });
    
    $(".showDddDishBtn").click(function () {
        reset();
    });
    $("#resetDishBtn").click(function () {
        reset();
    });
});