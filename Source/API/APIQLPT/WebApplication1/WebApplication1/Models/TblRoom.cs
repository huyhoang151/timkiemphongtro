using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblRoom
    {
        public TblRoom()
        {
            TblElectrics = new HashSet<TblElectric>();
            TblReceipts = new HashSet<TblReceipt>();
            TblRoomDetails = new HashSet<TblRoomDetail>();
            TblWaters = new HashSet<TblWater>();
        }

        public string RoomId { get; set; }
        public string Location { get; set; }
        public int? MaxQuantity { get; set; }
        public int? CurrentQuantity { get; set; }
        public decimal? RoomPrice { get; set; }
        public int? WaterNo { get; set; }
        public int? ElectricNo { get; set; }
        public string Address { get; set; }
        public string RoomTypeId { get; set; }
        public string StatusId { get; set; }
        public string UserTypeId { get; set; }

        public virtual TblRoomType RoomType { get; set; }
        public virtual TblStatus Status { get; set; }
        public virtual TblUserType UserType { get; set; }
        public virtual ICollection<TblElectric> TblElectrics { get; set; }
        public virtual ICollection<TblReceipt> TblReceipts { get; set; }
        public virtual ICollection<TblRoomDetail> TblRoomDetails { get; set; }
        public virtual ICollection<TblWater> TblWaters { get; set; }
    }
}
