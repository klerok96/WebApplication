<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CarID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="CarID" HeaderText="CarID" InsertVisible="False" ReadOnly="True" SortExpression="CarID" />
                    <asp:BoundField DataField="CarName" HeaderText="CarName" SortExpression="CarName" />
                    <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                    <asp:BoundField DataField="Power" HeaderText="Power" SortExpression="Power" />
                    <asp:BoundField DataField="Consumption" HeaderText="Consumption" SortExpression="Consumption" />
                    <asp:BoundField DataField="ColorID" HeaderText="ColorID" SortExpression="ColorID" />
                    <asp:BoundField DataField="DiskCarID" HeaderText="DiskCarID" SortExpression="DiskCarID" />
                    <asp:BoundField DataField="ColorName" HeaderText="ColorName" SortExpression="ColorName" />
                    <asp:BoundField DataField="DiskCarName" HeaderText="DiskCarName" SortExpression="DiskCarName" />
                    <asp:BoundField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel" />
                    <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarsConnectionString %>" SelectCommand="SELECT Car.CarID, Car.CarName, Car.Cost, Car.Power, Car.Consumption, Car.ColorID, Car.DiskCarID, Color.ColorName, DiskCar.DiskCarName, Users.AccessLevel, Users.Login FROM Users INNER JOIN UserCar ON Users.UserID = UserCar.UserID INNER JOIN Car ON UserCar.CarID = Car.CarID INNER JOIN DiskCar ON Car.DiskCarID = DiskCar.DiskCarID INNER JOIN Color ON Car.ColorID = Color.ColorID WHERE (Users.Login = 'admin')"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
