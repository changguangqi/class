<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            AddSth();
        });
        $(function () {
            $(".main").unbind("scroll").bind("scroll", function (e) {
                var sum = this.scrollHeight;
                if (sum <= $(this).scrollTop() + $(this).height()) {
                    AddSth();
                }
            });
        });
        function AddSth() {
            $.ajax({
                type: 'POST',
                url: "index.aspx/ReturnSth",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                //data: "",
                success: function (data) {
                    json = $.parseJSON(data.d);
                    for (var i in json) {
                        var tbBody = "<ul><li>" + json[i].sth + "</li></ul>";
                        $(".main").append(tbBody);
                    }
                    $(".main").append("<hr />");
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>下拉加载更多</div><br />
        <div class="main" style="border: 1px solid red; height: 700px; overflow: auto;"></div>
    </form>
</body>
</html>
