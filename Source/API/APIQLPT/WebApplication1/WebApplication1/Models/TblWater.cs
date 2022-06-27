using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblWater
    {
        public string RoomId { get; set; }
        public string Month { get; set; }
        public int? OldNumber { get; set; }
        public int? NewNumber { get; set; }
        public int? UPrice { get; set; }
        public int? Amount { get; set; }

        public virtual TblRoom Room { get; set; }
    }
}
