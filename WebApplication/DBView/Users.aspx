<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication.Users.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Пользователи
    <br />
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
            <asp:BoundField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel" />
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete?'); " CausesValidation="False" CommandName="Delete" Text="Удалить"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([Login], [AccessLevel]) VALUES (@Login, @AccessLevel)" SelectCommand="SELECT [UserID], [Login], [AccessLevel] FROM [Users] WHERE ([Login] &lt;&gt; @Login)" UpdateCommand="UPDATE [Users] SET [Login] = @Login, [AccessLevel] = @AccessLevel WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="AccessLevel" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="admin" Name="Login" SessionField="Login" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="AccessLevel" Type="String" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />


 </asp:Content>
