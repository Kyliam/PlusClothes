using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload fileUpload = (FileUpload)FormView1.FindControl("FileUpload1");
            string webPath = Server.MapPath("~/Images/");
            string localPath = @"E:\PTUDTMDT\ecommerce\ecommerce\imgs\";

            if (fileUpload.HasFile)
            {
                // Lưu tệp tin vào thư mục trong ứng dụng web
                string webFilePath = Path.Combine(webPath, fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(webFilePath);

                // Lưu tệp tin vào thư mục trên máy local
                string localFilePath = Path.Combine(localPath, fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(localFilePath);

                // Cập nhật giá trị của tham số image trong SqlDataSource
                SqlDataSource1.InsertParameters["image"].DefaultValue = fileUpload.FileName;
            }
        }

        protected void ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload fileUpload = (FileUpload)FormView1.FindControl("FileUpload1");
            string webPath = Server.MapPath("~/Images/");
            string localPath = @"E:\PTUDTMDT\ecommerce\ecommerce\imgs\";

            if (fileUpload.HasFile)
            {
                // Lưu tệp tin vào thư mục trong ứng dụng web
                string webFilePath = Path.Combine(webPath, fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(webFilePath);

                // Lưu tệp tin vào thư mục trên máy local
                string localFilePath = Path.Combine(localPath, fileUpload.FileName);
                fileUpload.PostedFile.SaveAs(localFilePath);

                // Cập nhật giá trị của tham số image trong SqlDataSource
                SqlDataSource1.UpdateParameters["image"].DefaultValue = fileUpload.FileName;
            }
        }
    }
}
