using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                LoadNewProducts();
                BindTopSellingProducts();


            }
        }

        private void LoadNewProducts()
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                //string query = "SELECT TOP 6 * FROM Products ORDER BY product_id DESC";
                string query = @"
                WITH DistinctProducts AS (
                    SELECT SKU, product_id, product_name, FORMAT(price, 'N0') AS formatted_price, category_id, image,
                           ROW_NUMBER() OVER (PARTITION BY SKU ORDER BY product_id DESC) AS RowNum
                    FROM Products
                )
                SELECT TOP 6 SKU, product_id, product_name, formatted_price, category_id, image
                FROM DistinctProducts
                WHERE RowNum = 1
                ORDER BY product_id DESC";


                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                newProductsRepeater.DataSource = dt;
                newProductsRepeater.DataBind();
            }
        }

        protected void BindTopSellingProducts()
        {
            string connectionString = "Data Source=DESKTOP-QAA0IV6\\KYLIAM;Initial Catalog=ecommerce;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";


            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                WITH RankedProducts AS (
                    SELECT p.product_id, p.product_name, p.price, p.image, p.SKU, SUM(oi.quantity) AS total_quantity,
                           ROW_NUMBER() OVER (PARTITION BY p.SKU ORDER BY SUM(oi.quantity) DESC) AS RowNum
                    FROM Products p
                    INNER JOIN Order_Item oi ON p.product_id = oi.product_id
                    GROUP BY p.product_id, p.product_name, p.price, p.image, p.SKU
                )
                SELECT TOP 5 product_id, product_name, price, image, SKU, total_quantity
                FROM RankedProducts
                WHERE RowNum = 1
                ORDER BY total_quantity DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }
}