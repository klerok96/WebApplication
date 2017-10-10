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
            <asp:BoundField DataField="Logon" HeaderText="Logon" SortExpression="Logon" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" InsertVisible="False" ReadOnly="True" />
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
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');" CausesValidation="False" CommandName="Delete" Text="Удалить"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionStringCars %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([Logon], [AccessLevel]) VALUES (@Logon, @AccessLevel)" SelectCommand="SELECT [Logon], [UserID], [AccessLevel] FROM [Users] WHERE ([Logon] &lt;&gt; @Logon)" UpdateCommand="UPDATE [Users] SET [Logon] = @Logon, [AccessLevel] = @AccessLevel WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Logon" Type="String" />
            <asp:Parameter Name="AccessLevel" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="admin" Name="Logon" SessionField="Login" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Logon" Type="String" />
            <asp:Parameter Name="AccessLevel" Type="String" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />


 </asp:Content>
