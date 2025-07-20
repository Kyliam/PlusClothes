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
    public partial class top3_5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTopProducts();
                LoadUnsoldProducts();
            }
        }
        private void LoadTopProducts()
        {
            string query = @"
                SELECT TOP 5 
                    p.product_id, 
                    p.product_name, 
                    SUM(oi.quantity) AS TotalSold
                FROM 
                    Products p
                INNER JOIN 
                    Order_Item oi ON p.product_id = oi.product_id
                GROUP BY 
                    p.product_id, p.product_name
                ORDER BY 
                    TotalSold DESC";

            DataTable dt = GetData(query);
            GridViewTopProducts.DataSource = dt;
            GridViewTopProducts.DataBind();
        }

        private void LoadUnsoldProducts()
        {
            string query = @"
                SELECT TOP 5
                    p.product_id, 
                    p.product_name,
                    p.size
                FROM 
                    Products p
                LEFT JOIN 
                    Order_Item oi ON p.product_id = oi.product_id
                WHERE 
                    oi.product_id IS NULL ORDER BY p.product_id ASC" ;

            DataTable dt = GetData(query);
            GridViewUnsoldProducts.DataSource = dt;
            GridViewUnsoldProducts.DataBind();
        }

        private DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
    }
}