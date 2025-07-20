<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="BTL.Statistics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Thống kê số lượng và doanh thu đơn hàng theo ngày/tháng/năm  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        .statistics {
            width: 80%;
            margin: 0 auto;
        }
        .statistics h2 {
            text-align: center;
        }
        .statistics table {
            width: 100%;
            border-collapse: collapse;
        }
        .statistics th, .statistics td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .statistics th {
            background-color: #4CAF50;
            color: white;
        }
        .btn-export{
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px;
            margin-top: 10px;
        }
        .ddl-date{
            margin-bottom: 10px;
            padding: 5px;
        }
    </style>
    <div class="statistics">
        <h2>Thống kê số lượng và doanh thu đơn hàng</h2>
        
     <%--   <asp:DropDownList ID="ddlStatisticsType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlStatisticsType_SelectedIndexChanged" CssClass="ddl-date">
            <asp:ListItem Text="Theo ngày" Value="Day" />
            <asp:ListItem Text="Theo tháng" Value="Month" />
            <asp:ListItem Text="Theo năm" Value="Year" />
        </asp:DropDownList>--%>
        
        <asp:GridView ID="GridViewStatistics" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date"  />
                <asp:BoundField DataField="OrderCount" HeaderText="Total orders" />
                <asp:BoundField DataField="TotalRevenue" HeaderText="Doanh thu" />
            </Columns>
        </asp:GridView>
        
        <asp:Button ID="btnExportPDF" runat="server" Text="Xuất ra PDF" OnClick="btnExportPDF_Click" CssClass="btn-export"/>
    </div>
</asp:Content>
