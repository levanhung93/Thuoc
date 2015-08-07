using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LeVanHung_OnTap.DataAccessLayer;

namespace LeVanHung_OnTap.BusinessLogicLayer
{
    public class ChuDeHoaBLL
    {
        public List<GetChuDeHoa_Result> ChuDeHoaResults()
        {
            using (BanHoaEntityEntities banHoaEntity=new BanHoaEntityEntities())
            {
                return banHoaEntity.GetChuDeHoa().ToList();
            }
        }
    }
}