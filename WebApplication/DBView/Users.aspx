<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication.Users.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Пользователи
    <br />
    <hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
            <asp:TemplateField HeaderText="AccessLevel" SortExpression="AccessLevel">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>admin</asp:ListItem>
                        <asp:ListItem>normal</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccessLevel") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionString %>" SelectCommand="SELECT [UserID], [Login], [AccessLevel] FROM [Users]" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([Login], [AccessLevel]) VALUES (@Login, @AccessLevel)" UpdateCommand="UPDATE [Users] SET [Login] = @Login, [AccessLevel] = @AccessLevel WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="AccessLevel" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="AccessLevel" Type="String" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <br />

 </asp:Content>
