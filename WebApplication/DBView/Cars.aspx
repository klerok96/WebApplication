<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="WebApplication.DBView.Cars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Машины
    <br />
    <hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CarID" DataSourceID="SqlDataSourceCars" style="margin-right: 2px">
        <Columns>
            <asp:BoundField DataField="CarID" HeaderText="CarID" InsertVisible="False" ReadOnly="True" SortExpression="CarID" />
            <asp:BoundField DataField="CarName" HeaderText="CarName" SortExpression="CarName" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Power" HeaderText="Power" SortExpression="Power" />
            <asp:BoundField DataField="Consumption" HeaderText="Consumption" SortExpression="Consumption" />
            <asp:TemplateField HeaderText="ColorID" SortExpression="ColorID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceColor" DataTextField="ColorName" DataValueField="ColorID" SelectedValue='<%# Bind("ColorID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceColor" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionStringCars %>" SelectCommand="SELECT * FROM [Color]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ColorName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DiskCarID" SortExpression="DiskCarID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceDiskCar" DataTextField="DiskCarName" DataValueField="DiskCarID" SelectedValue='<%# Bind("DiskCarID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceDiskCar" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionStringCars %>" SelectCommand="SELECT * FROM [DiskCar]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DiskCarName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DiskCarName" HeaderText="DiskCarName" SortExpression="DiskCarName" Visible="False" />
            <asp:BoundField DataField="ColorName" HeaderText="ColorName" SortExpression="ColorName" Visible="False" />
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?');" CommandName="Delete" Text="Удалить"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCars" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionStringCars %>" DeleteCommand="DELETE FROM [Car] WHERE [CarID] = @CarID" InsertCommand="INSERT INTO [Car] ([CarName], [Cost], [Power], [Consumption], [ColorID], [DiskCarID]) VALUES (@CarName, @Cost, @Power, @Consumption, @ColorID, @DiskCarID)" SelectCommand="SELECT Car.CarID, Car.CarName, Car.Cost, Car.Power, Car.Consumption, Car.ColorID, Car.DiskCarID, DiskCar.DiskCarName, Color.ColorName FROM Car INNER JOIN Color ON Car.ColorID = Color.ColorID INNER JOIN DiskCar ON Car.DiskCarID = DiskCar.DiskCarID" UpdateCommand="UPDATE [Car] SET [CarName] = @CarName, [Cost] = @Cost, [Power] = @Power, [Consumption] = @Consumption, [ColorID] = @ColorID, [DiskCarID] = @DiskCarID WHERE [CarID] = @CarID">
        <DeleteParameters>
            <asp:Parameter Name="CarID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CarName" Type="String" />
            <asp:Parameter Name="Cost" Type="Decimal" />
            <asp:Parameter Name="Power" Type="Int32" />
            <asp:Parameter Name="Consumption" Type="Int32" />
            <asp:Parameter Name="ColorID" Type="Int32" />
            <asp:Parameter Name="DiskCarID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CarName" Type="String" />
            <asp:Parameter Name="Cost" Type="Decimal" />
            <asp:Parameter Name="Power" Type="Int32" />
            <asp:Parameter Name="Consumption" Type="Int32" />
            <asp:Parameter Name="ColorID" Type="Int32" />
            <asp:Parameter Name="DiskCarID" Type="Int32" />
            <asp:Parameter Name="CarID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
