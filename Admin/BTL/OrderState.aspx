<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderState.aspx.cs" Inherits="BTL.OrderState" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <style>
        .order-list th{
            color: white;
        }
    </style>
    <h2>Quản lý trạng thái đơn hàng</h2>
    <div class="order-list">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="order_id" HeaderStyle-BackColor="#4CAF50" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="order_id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="order_date" HeaderText="Ngày đặt" ReadOnly="True" />
                <asp:BoundField DataField="total_price" HeaderText="Tổng giá" ReadOnly="True" />
                <asp:BoundField DataField="username" HeaderText="Tên người mua" ReadOnly="True" />
                <asp:TemplateField HeaderText="Shipment State">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="status-dropdown">
                            <asp:ListItem Text="Đã giao" Value="Đã giao"></asp:ListItem>
                            <asp:ListItem Text="Đang xử lý" Value="Đang xử lý"></asp:ListItem>
                            <asp:ListItem Text="Trả hàng" Value="Trả hàng"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    
</asp:Content>
