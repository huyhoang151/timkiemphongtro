using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblRentalType
    {
        public TblRentalType()
        {
            TblPosts = new HashSet<TblPost>();
        }

        public string RentalTypeId { get; set; }
        public string RentalTypeName { get; set; }
        public string Icon { get; set; }

        public virtual ICollection<TblPost> TblPosts { get; set; }
    }
}
