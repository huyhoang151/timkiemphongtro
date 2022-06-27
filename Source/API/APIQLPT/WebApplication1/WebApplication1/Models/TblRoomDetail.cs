using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblRoomDetail
    {
        public string RoomId { get; set; }
        public string CustomerIdnumber { get; set; }
        public DateTime? RentDay { get; set; }
        public DateTime? FinishDay { get; set; }

        public virtual TblGuest CustomerIdnumberNavigation { get; set; }
        public virtual TblRoom Room { get; set; }
    }
}
