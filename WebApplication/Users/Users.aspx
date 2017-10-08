<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication.Users.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <br />
      <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating">
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                 <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                 <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                 <asp:TemplateField HeaderText="AccessLevel" SortExpression="AccessLevel">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AccessLevel") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccessLevel") %>'></asp:Label>
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
                 <asp:ControlParameter ControlID="Label2" DefaultValue="a" Name="Login" PropertyName="Text" Type="String" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Login" Type="String" />
                 <asp:Parameter Name="AccessLevel" Type="String" />
                 <asp:Parameter Name="UserID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>

</asp:Content>
