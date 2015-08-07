using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LeVanHung_OnTap.BusinessLogicLayer;
using LeVanHung_OnTap.DataAccessLayer;

namespace LeVanHung_OnTap.PresentationLayer
{
    public partial class AddFlower : System.Web.UI.Page
    {
        ChuDeHoaBLL chuDeHoa=new ChuDeHoaBLL();
        HoaBLL hoaBll=new HoaBLL();
        Hoa hoa=new Hoa();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThiHoa();
                LoadChuDeHoa();
            }
        }

        private void LoadChuDeHoa()
        {
            ddlChuDe.DataSource = chuDeHoa.ChuDeHoaResults();
            ddlChuDe.DataTextField = "LoaiChuDe";
            ddlChuDe.DataValueField = "MaChuDe";
            ddlChuDe.DataBind();
        }

        private void HienThiHoa()
        {
            grvHoa.DataSource = hoaBll.GetFlowerResults();
            grvHoa.DataBind();
        }

        protected void ThemClick(object sender, EventArgs e)
        {
            try
            {
                string fileName = uploadFile.FileName;
                if (fileName!= "")
                {
                    fileName = fileName.ToLower();
                    if (fileName.EndsWith("jpg") || fileName.EndsWith("bmp") || fileName.EndsWith("png") || fileName.EndsWith("gif"))
                    {
                        uploadFile.SaveAs(Server.MapPath("~/PresentationLayer/Images/Products/")+fileName);
                    }
                }
                hoa.MaHoa = txtMaHoa.Text;
                hoa.TenHoa = txtTenHoa.Text;
                hoa.GiaBan = float.Parse(txtGiaBan.Text);
                hoa.SoLuong = int.Parse(txtSoLuong.Text);
                hoa.HinhAnh = fileName;
                hoa.MaChuDe = ddlChuDe.SelectedValue;
                hoaBll.InsertFlower(hoa);
                HienThiHoa();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }

        protected void grvHoa_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvHoa.PageIndex = e.NewPageIndex;
            HienThiHoa();
        }
    }
}