using System;
using System.Collections.Generic;

#nullable disable

namespace WebApplication1.Models
{
    public partial class TblUser
    {
        public TblUser()
        {
            TblLikes = new HashSet<TblLike>();
            TblPosts = new HashSet<TblPost>();
        }

        public string UserName { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Avatar { get; set; }
        public string UserTypeId { get; set; }
        public bool? Success { get; set; }

        public virtual TblUserType UserType { get; set; }
        public virtual ICollection<TblLike> TblLikes { get; set; }
        public virtual ICollection<TblPost> TblPosts { get; set; }
    }
}
