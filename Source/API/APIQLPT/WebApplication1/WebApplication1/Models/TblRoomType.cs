using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblRoomType
    {
        public TblRoomType()
        {
            TblRooms = new HashSet<TblRoom>();
        }

        public string RoomTypeId { get; set; }
        public string RoomName { get; set; }

        public virtual ICollection<TblRoom> TblRooms { get; set; }
    }
}
