using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BTL
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                LoadAllProducts();
            }
        }
        private void LoadAllProducts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Products", con))
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
        protected void ctl00_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ItemCommand(object source, DataListCommandEventArgs e)
        {
          
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = searchProduct.Text.Trim();
            if (!string.IsNullOrEmpty(searchTerm))
            {
                SearchProductsByName(searchTerm);
            }
        }

        private void SearchProductsByName(string productName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE product_name LIKE @ProductName", con))
                {
                    cmd.Parameters.AddWithValue("@ProductName", "%" + productName + "%");
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
            LoadAllProducts();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string productName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("product_nameTextBox")).Text;
            string SKU = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("SKUTextBox")).Text;
            string description = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("descriptionTextBox")).Text;
            decimal price = Convert.ToDecimal(((TextBox)GridView1.Rows[e.RowIndex].FindControl("priceTextBox")).Text);
            int stock = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].FindControl("stockTextBox")).Text);
            // Handling file upload
            FileUpload fileUpload = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            string image = ((Label)GridView1.Rows[e.RowIndex].FindControl("imageLabel")).Text;
            string size = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("sizeTextBox")).Text;
            int categoryId = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].FindControl("category_idTextBox")).Text);
            if (fileUpload.HasFile)
            {
                string path = Server.MapPath("~/Images/");
                string localPath = @"E:\PTUDTMDT\ecommerce\ecommerce\imgs\";
                fileUpload.SaveAs(path + fileUpload.FileName);

                // Lưu tệp tin vào thư mục trên máy local
                string localFilePath = Path.Combine(localPath, fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(localFilePath);
                image = fileUpload.FileName;


            }
            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Products SET product_name = @ProductName, SKU = @SKU, description = @Description, price = @Price, stock = @Stock, image = @Image, size = @Size, category_id = @CategoryId WHERE product_id = @ProductId", con))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.Parameters.AddWithValue("@ProductName", productName);
                    cmd.Parameters.AddWithValue("@SKU", SKU);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Stock", stock);
                    cmd.Parameters.AddWithValue("@Image", image);
                    cmd.Parameters.AddWithValue("@Size", size);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            LoadAllProducts();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string connectionString = ConfigurationManager.ConnectionStrings["ecommerceConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE product_id = @ProductId", con))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            LoadAllProducts();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadAllProducts();
        }
    }
 }

