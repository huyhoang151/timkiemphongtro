using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblLike
    {
        public int PostId { get; set; }
        public string UserName { get; set; }

        public virtual TblPost Post { get; set; }
        public virtual TblUser UserNameNavigation { get; set; }
        public string Title { get; set; }
        public string Img1 { get; set; }
        public string Img2 { get; set; }
        public string Img3 { get; set; }
        public string Video { get; set; }
        public DateTime? StartDay { get; set; }
        public DateTime? FinishDay { get; set; }
        public bool? Status { get; set; }
        public string RentalTypeId { get; set; }
        public int? RentalPrice { get; set; }
        public string Address { get; set; }
        public int? Area { get; set; }
        public string Contact { get; set; }
    }
}
