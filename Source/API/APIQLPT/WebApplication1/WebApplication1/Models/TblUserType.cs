using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblUserType
    {
        public TblUserType()
        {
            TblAuthentications = new HashSet<TblAuthentication>();
            TblRooms = new HashSet<TblRoom>();
            TblUsers = new HashSet<TblUser>();
        }

        public string UserTypeId { get; set; }
        public string UserTypeName { get; set; }

        public virtual ICollection<TblAuthentication> TblAuthentications { get; set; }
        public virtual ICollection<TblRoom> TblRooms { get; set; }
        public virtual ICollection<TblUser> TblUsers { get; set; }
    }
}
