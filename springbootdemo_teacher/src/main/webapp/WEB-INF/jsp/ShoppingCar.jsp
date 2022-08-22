<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>srselectpageALL</title>
        <script src="/js/jquery-3.6.0.min.js"></script>
        <script src="/js/bootstrap.bundle.min.js"></script>
        <title>購物車</title>
    </head>
    <body>
        <div>
            <input type="text" id="cid">
        </div>
        <div>
            <!-- 商品資料 -->
            <div>
                <table class="mytable" id="list_data_json">
                    <thead>
                        <tr>
                            <!-- C1 -->
                            <th>cId</th>
                            <!-- SR -->
                            <th>srShoppingRecord_Id</th>
                            <th>srtime</th>
                            <th>srCount</th>
                            <!-- SH -->
                            <th>shItemId</th>
                            <th>shItemName</th>
                            <th>shImg</th>
                            <th>shPrice</th>
                            <th>shClassify</th>
                            <th>shState</th>
                            <!-- C2 -->
                            <th>c2Id</th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <script>
            $(document).ready(
                function () {
                    // findAllByCidBtn

                    $(cid).keyup(function (event) {
                        if (event.which === 13) {
                            var textcid = document.getElementById('cid').value;
                            alert(textcid)
                            var textcid = document.getElementById('cid').value;
                            console.log(textcid)
                            var dtoObj = {
                                "cid": textcid
                            };
                            console.log(dtoObj)
                            var dtoJson = JSON.stringify(dtoObj);
                            console.log(dtoJson)

                            $.ajax({
                                url: "http://localhost:8080/ShoppingCar/findAll?cid=" + textcid,
                                contentType: 'application/json', // 送過去的資料型別
                                dataType: 'json', // 回傳回來的資料型別
                                method: 'get',
                                // data:dtoJson,
                                success: function (result) {
                                    $('#list_data_json tbody tr ').remove();
                                    msg_data = '<tbody>'
                                    $.each(result, function (index, value) {
                                        var state = '';
                                        console.log(value.shophousebean.shState)
                                        if (value.shophousebean.shState == true) {
                                            state = "成交";
                                        }
                                        if (value.shophousebean.shState == false) {
                                            state = "退貨";
                                        }
                                        msg_data += '<tr>'
                                        msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
                                        msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
                                        msg_data += '<td>' + value.srtime + '</td>'
                                        msg_data += '<td>' + value.srCount + '</td>'
                                        msg_data += '<td>' + value.shophousebean.shItemId + '</td>'
                                        msg_data += '<td>' + value.shophousebean.shItemName + '</td>'
                                        msg_data += '<td>' + value.shophousebean.shImg + '</td>'
                                        msg_data += '<td>' + value.shophousebean.shPrice + '</td>'
                                        msg_data += '<td>' + value.shophousebean.shClassify + '</td>'
                                        msg_data += '<td>' + state + '</td>'
                                        msg_data += '<td><a href="' + value.shophousebean.c2Id + '">' + value.shophousebean.c2Id + '</a></td>'
                                        msg_data += '</tr>'
                                    })
                                    msg_data += '</tbody>'
                                    $('#list_data_json').append(msg_data)
                                },
                                error: function (err) {
                                    alert('輸入ID 不存在，請在試一次')
                                }
                            })
                        }
                    });
                })
        </script>
    </body>
    </html>