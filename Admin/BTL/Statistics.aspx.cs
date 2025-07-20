using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace BTL
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatistics();
            }
        }

       
        private void LoadStatistics()
        {

            string query = @"
            SELECT 
                FORMAT(CAST(order_date AS DATE), 'yyyy-MM-dd') AS [Date], 
                COUNT(order_id) AS OrderCount, 
                SUM(total_price) AS TotalRevenue, 
                Shipment.state
            FROM 
                Orders INNER JOIN Shipment ON Orders.shipment_id = Shipment.shipment_id
            WHERE 
                Shipment.state = N'Đã giao'
            GROUP BY 
                CAST(order_date AS DATE), 
                Shipment.state
            ORDER BY 
                [Date]";




            DataTable dt = GetData(query);
            GridViewStatistics.DataSource = dt;
            GridViewStatistics.DataBind();

        
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

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();
        }

        private void ExportGridToPDF()
        {
            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document();
                PdfWriter.GetInstance(document, ms);
                document.Open();

                PdfPTable pdfTable = new PdfPTable(GridViewStatistics.HeaderRow.Cells.Count);
                pdfTable.WidthPercentage = 100; // Set width to 100%

                // Add header
                foreach (TableCell headerCell in GridViewStatistics.HeaderRow.Cells)
                {
                    Font font = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);

                    PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text, font));
                    pdfCell.BackgroundColor = new BaseColor(GridViewStatistics.HeaderStyle.BackColor);
                    pdfTable.AddCell(pdfCell);
                }

                // Add data rows
                foreach (GridViewRow gridViewRow in GridViewStatistics.Rows)
                {
                    foreach (TableCell tableCell in gridViewRow.Cells)
                    {
                        Font font = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);

                        PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text, font));
                        pdfTable.AddCell(pdfCell);
                    }
                }

                document.Add(pdfTable);
                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Statistics.pdf");
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(ms.ToArray());
                Response.End();
            }
        }
    }
}
