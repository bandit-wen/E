<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../image/mystyle1.css">
</head>

<body bgcolor="#8dd8f8">
<script>
    function isValid() {
        var content = document.getElementById("content").value;

        if (content == "") {
            ss
            alert("内容不能为空!");
            document.getElementById("content").focus();
            return false;
        }

    }
</script>
<%
    request.setCharacterEncoding("utf-8");
    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("na");
%>
<div>
</div>

<form name="lyb" action="/../MessageServlet?id=<%=id%>" method="post" onsubmit="return isValid(this);">
    <table>
        <tr height="100">
            <td></td>
        </tr>
    </table>
    <table align="center" border="1">
        <tr align="center">
            <th colspan="2">
                <font face="华文楷体" color="#0000a0"><strong><font size="5">添加留言</font> </strong> </font>
            </th>
        </tr>
        <tr>
            <td width="60" align="right">姓名：</td>
            <td><%out.print(name); %></td>
        </tr>
        <tr>
            <td align="right">留言：</td>
            <td align="left">
                <textarea name="content" id="content" cols="80" rows="15"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="action" value="new">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="submit" id="submit" value="提交留言">
                &nbsp;
                <input type="reset" name="reset" id="reset" value="重新填写">
            </td>
        </tr>
    </table>
</form>
<tr height="100">
    <td></td>
</tr>

</body>
</html>
