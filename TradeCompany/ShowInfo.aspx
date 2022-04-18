<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="TradeCompany.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Клиенты:&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surename" HeaderText="Фамилия" SortExpression="Surename" />
                    <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" SortExpression="YearOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TraderCompanyDBConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        </p>
        <p>
            Заказы:&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                    <asp:BoundField DataField="IdCust" HeaderText="Номер заказа" SortExpression="IdCust" ReadOnly="True" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quant" HeaderText="Количество" SortExpression="Quant" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TraderCompanyDBConnectionString %>" InsertCommand="Insert into Orders(Title,IdCust,Price,Quant) values(@Title,@IdCust,@Price,@Quant)" SelectCommand="SELECT * FROM [Orders] WHERE ([IdCust] = @IdCust)" DeleteCommand="Delete from Orders where Id=@Id" UpdateCommand="Update Orders set Title=@Title, IdCust=@IdCust, Price=@Price, Quant=@Quant where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="IdCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Quant" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="IdCust" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="IdCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Price" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Quant" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Добавить заказ" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Редактировать заказы" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Удалить заказ" />
        </p>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <br />
            Название товара:&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            Цена:&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            Количество:&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Добавить" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Отмена" />
        </asp:Panel>
    </form>
</body>
</html>
