using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class OrderState : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllOrders();
            }
        }
        private void LoadAllOrders()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Orders.order_id, Orders.order_date, Orders.total_price, Orders.user_id, Shipment.state,Users.username FROM Orders INNER JOIN Shipment ON Orders.shipment_id = Shipment.shipment_id INNER JOIN Users ON Orders.user_id = Users.user_id", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadAllOrders();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int orderId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            DropDownList ddlState = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlState");
            string state = ddlState.SelectedValue;

            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Shipment SET state = @State FROM Shipment INNER JOIN Orders ON Shipment.shipment_id = Orders.shipment_id WHERE Orders.order_id = @OrderId", con))
                {
                    cmd.Parameters.AddWithValue("@OrderId", orderId);
                    cmd.Parameters.AddWithValue("@State", state);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            LoadAllOrders();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadAllOrders();
        }
    }
}