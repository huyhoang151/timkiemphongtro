using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblReceipt
    {
        public string RoomId { get; set; }
        public string Month { get; set; }
        public int? RoomFee { get; set; }
        public int? WaterFee { get; set; }
        public int? EletricFee { get; set; }
        public int? OtherFee { get; set; }
        public string Note { get; set; }
        public int? Debt { get; set; }
        public bool? Status { get; set; }

        public virtual TblRoom Room { get; set; }
    }
}
