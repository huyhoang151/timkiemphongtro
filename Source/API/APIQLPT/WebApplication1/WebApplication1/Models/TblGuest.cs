using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblGuest
    {
        public TblGuest()
        {
            TblRoomDetails = new HashSet<TblRoomDetail>();
        }

        public string IdNumber { get; set; }
        public string CustomerName { get; set; }
        public string Address { get; set; }
        public string Birthday { get; set; }
        public string Gender { get; set; }
        public string PhoneNumber { get; set; }
        public string Photo { get; set; }
        public string Note { get; set; }

        public virtual ICollection<TblRoomDetail> TblRoomDetails { get; set; }
    }
}
