<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication.Users.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Пользователи
    <br />
    <hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSourceUsers" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
            <asp:TemplateField HeaderText="AccessLevel" SortExpression="AccessLevel">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("AccessLevel") %>'>
                        <asp:ListItem>normal</asp:ListItem>
                        <asp:ListItem>admin</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccessLevel") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?');" CommandName="Delete" Text="Удалить"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionString %>" SelectCommand="SELECT [AccessLevel], [Login], [UserID] FROM [Users] WHERE ([Login] &lt;&gt; @Login)" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([AccessLevel], [Login]) VALUES (@AccessLevel, @Login)" UpdateCommand="UPDATE [Users] SET [AccessLevel] = @AccessLevel, [Login] = @Login WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AccessLevel" Type="String" />
            <asp:Parameter Name="Login" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="admin" Name="Login" SessionField="Login" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AccessLevel" Type="String" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />


 </asp:Content>
