using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblScreen
    {
        public TblScreen()
        {
            TblAuthentications = new HashSet<TblAuthentication>();
        }

        public string ScreenId { get; set; }
        public string ScreenName { get; set; }

        public virtual ICollection<TblAuthentication> TblAuthentications { get; set; }
    }
}
