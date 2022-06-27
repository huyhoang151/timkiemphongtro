using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblStatus
    {
        public TblStatus()
        {
            TblRooms = new HashSet<TblRoom>();
        }

        public string StatusId { get; set; }
        public string StatusName { get; set; }

        public virtual ICollection<TblRoom> TblRooms { get; set; }
    }
}
