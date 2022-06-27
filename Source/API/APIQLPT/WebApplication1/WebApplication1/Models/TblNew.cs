using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblNew
    {
        public int NewsId { get; set; }
        public int? PostId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Contact { get; set; }
        public string Object { get; set; }
        
        public int? Deposit { get; set; }

        public virtual TblPost Post { get; set; }
    }
}
