<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".main").unbind("scroll").bind("scroll", function (e) {
                var sum = this.scrollHeight;
                if (sum <= $(this).scrollTop() + $(this).height()) {
                    $(".main").append($(".child").clone());
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>下拉加载更多</div>
        <div class="main" style="height: 700px; overflow: auto;">
            <div class="child" style='border: 1px solid red; margin-top: 20px; color: grey; height: 800px'></div>
        </div>
    </form>
</body>
</html>
