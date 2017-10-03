<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Регестрация<br />
            <hr />
            <br />
            Логин
            <asp:TextBox ID="Login" runat="server"></asp:TextBox>
            <br />
            <br />
            Пароль <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            Подтвердите пароль <asp:TextBox ID="PasswordConfirm" runat="server"></asp:TextBox>
<%--            <asp:CompareValidator 
                ID="CompareValidator1" 
                runat="server" 
                ErrorMessage="Пароли не совпадают"
                ControlToValidate="PasswordConfirm" 
                ControlToCompare="Password"
                ForeColor="Red"
                >
            </asp:CompareValidator>--%>
            <br />
            <br />
            <asp:Button ID="Save" runat="server" Text="Сохранить" OnClick="Save_Click" />
        </div>
    </form>
</body>
</html>
