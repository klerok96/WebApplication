<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="WebApplication.Authorization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Вход<br />
            <hr />
            <br />
            Логин
            <asp:TextBox ID="Login" runat="server"></asp:TextBox>
            <br />
            Пароль <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Enter" runat="server" Text="Вход" OnClick="Enter_Click" />
            <br />
            <br />
            <asp:Button ID="Registration" PostBackUrl="~/Registration.aspx"  runat="server" Text="Регестрация" />
        </div>
    </form>
</body>
</html>
