using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using LeVanHung_OnTap.DataAccessLayer;

namespace LeVanHung_OnTap.BusinessLogicLayer
{
    public class HoaBLL
    {
        public List<GetFlower_Result> GetFlowerResults()
        {
            using (BanHoaEntityEntities banHoaEntity=new BanHoaEntityEntities())
            {
                return banHoaEntity.GetFlower().ToList();
            }
        }

        public string InsertFlower(Hoa hoa)
        {
            ObjectParameter err = new ObjectParameter("Error", typeof(string));
            using (BanHoaEntityEntities banHoaEntity=new BanHoaEntityEntities())
            {
                banHoaEntity.InsertFlower(hoa.MaHoa, hoa.TenHoa, hoa.GiaBan, hoa.SoLuong, hoa.HinhAnh, hoa.MaChuDe, err);
            }
            return err.Value.ToString();
        }
    }
}