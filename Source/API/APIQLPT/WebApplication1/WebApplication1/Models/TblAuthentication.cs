using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblAuthentication
    {
        public string UserTypeId { get; set; }
        public string ScreenId { get; set; }
        public bool? IsAuthenticate { get; set; }

        public virtual TblScreen Screen { get; set; }
        public virtual TblUserType UserType { get; set; }
    }
}
