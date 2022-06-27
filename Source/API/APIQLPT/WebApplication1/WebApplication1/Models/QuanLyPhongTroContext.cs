using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace WebApplication1.Models
{
    public partial class QuanLyPhongTroContext : DbContext
    {
        public QuanLyPhongTroContext()
        {
        }

        public QuanLyPhongTroContext(DbContextOptions<QuanLyPhongTroContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TblAuthentication> TblAuthentications { get; set; }
        public virtual DbSet<TblElectric> TblElectrics { get; set; }
        public virtual DbSet<TblGuest> TblGuests { get; set; }
        public virtual DbSet<TblLike> TblLikes { get; set; }
        public virtual DbSet<TblNew> TblNews { get; set; }
        public virtual DbSet<TblPost> TblPosts { get; set; }
        public virtual DbSet<TblReceipt> TblReceipts { get; set; }
        public virtual DbSet<TblRentalType> TblRentalTypes { get; set; }
        public virtual DbSet<TblRoom> TblRooms { get; set; }
        public virtual DbSet<TblRoomDetail> TblRoomDetails { get; set; }
        public virtual DbSet<TblRoomType> TblRoomTypes { get; set; }
        public virtual DbSet<TblScreen> TblScreens { get; set; }
        public virtual DbSet<TblStatus> TblStatuses { get; set; }
        public virtual DbSet<TblUser> TblUsers { get; set; }
        public virtual DbSet<TblUserType> TblUserTypes { get; set; }
        public virtual DbSet<TblWater> TblWaters { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=QuanLyPhongTro.mssql.somee.com;Database=QuanLyPhongTro;User ID=alibaba_009_SQLLogin_1;Password=hes7io4y6d;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<TblAuthentication>(entity =>
            {
                entity.HasKey(e => new { e.UserTypeId, e.ScreenId });

                entity.ToTable("tblAuthentication");

                entity.Property(e => e.UserTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("userTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.ScreenId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("screenID")
                    .IsFixedLength(true);

                entity.Property(e => e.IsAuthenticate).HasColumnName("isAuthenticate");

                entity.HasOne(d => d.Screen)
                    .WithMany(p => p.TblAuthentications)
                    .HasForeignKey(d => d.ScreenId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblAuthentication_tblScreen");

                entity.HasOne(d => d.UserType)
                    .WithMany(p => p.TblAuthentications)
                    .HasForeignKey(d => d.UserTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblAuthentication_tblAuthentication");
            });

            modelBuilder.Entity<TblElectric>(entity =>
            {
                entity.HasKey(e => new { e.RoomId, e.Month })
                    .HasName("PK_tbtElectric");

                entity.ToTable("tblElectric");

                entity.Property(e => e.RoomId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomID")
                    .IsFixedLength(true);

                entity.Property(e => e.Month)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("month");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.NewNumber).HasColumnName("newNumber");

                entity.Property(e => e.OldNumber).HasColumnName("oldNumber");

                entity.Property(e => e.UPrice).HasColumnName("uPrice");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.TblElectrics)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbtElectric_tblRoom");
            });

            modelBuilder.Entity<TblGuest>(entity =>
            {
                entity.HasKey(e => e.IdNumber);

                entity.ToTable("tblGuest");

                entity.Property(e => e.IdNumber)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("idNumber")
                    .IsFixedLength(true);

                entity.Property(e => e.Address)
                    .HasMaxLength(200)
                    .HasColumnName("address");

                entity.Property(e => e.Birthday)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("birthday");

                entity.Property(e => e.CustomerName)
                    .HasMaxLength(50)
                    .HasColumnName("customerName");

                entity.Property(e => e.Gender)
                    .HasMaxLength(50)
                    .HasColumnName("gender");

                entity.Property(e => e.Note)
                    .HasMaxLength(100)
                    .HasColumnName("note");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("phoneNumber");

                entity.Property(e => e.Photo)
                    .HasMaxLength(200)
                    .HasColumnName("photo");
            });

            modelBuilder.Entity<TblLike>(entity =>
            {
                entity.HasKey(e => new { e.PostId, e.UserName });

                entity.ToTable("tblLike");

                entity.Property(e => e.PostId).HasColumnName("postID");

                entity.Property(e => e.Area).HasColumnName("area");

                entity.Property(e => e.Contact)
                    .HasMaxLength(50)
                    .HasColumnName("contact");

                entity.Property(e => e.UserName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("userName")
                    .IsFixedLength(true);

                entity.Property(e => e.FinishDay)
                    .HasColumnType("datetime")
                    .HasColumnName("finishDay");

                entity.Property(e => e.Img1)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("img1");

                entity.Property(e => e.Img2)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("img2");

                entity.Property(e => e.Img3)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("img3");

                entity.Property(e => e.RentalTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("rentalTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.StartDay)
                    .HasColumnType("datetime")
                    .HasColumnName("startDay");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasDefaultValueSql("('False')");

                entity.Property(e => e.Title)
                    .HasMaxLength(50)
                    .HasColumnName("title");

                entity.Property(e => e.Video)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("video");

                entity.Property(e => e.Address)
                    .HasMaxLength(500)
                    .HasColumnName("address");

                entity.Property(e => e.RentalPrice).HasColumnName("rentalPrice");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.TblLikes)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblLike_tblPost");

                entity.HasOne(d => d.UserNameNavigation)
                    .WithMany(p => p.TblLikes)
                    .HasForeignKey(d => d.UserName)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblLike_tblUser");
            });

            modelBuilder.Entity<TblNew>(entity =>
            {
                entity.HasKey(e => e.NewsId);

                entity.ToTable("tblNew");

                entity.Property(e => e.NewsId).HasColumnName("newsID");
             
                entity.Property(e => e.Contact)
                    .HasMaxLength(150)
                    .HasColumnName("contact");

                entity.Property(e => e.Deposit).HasColumnName("deposit");

                entity.Property(e => e.Description)
                    .HasMaxLength(500)
                    .HasColumnName("description");

                entity.Property(e => e.Object)
                    .HasMaxLength(50)
                    .HasColumnName("object");

                entity.Property(e => e.PostId).HasColumnName("postID");                

                entity.Property(e => e.Title)
                    .HasMaxLength(50)
                    .HasColumnName("title");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.TblNews)
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK_news_post");
            });

            modelBuilder.Entity<TblPost>(entity =>
            {
                entity.HasKey(e => e.PostId)
                    .HasName("PK_post");

                entity.ToTable("tblPost");

                entity.Property(e => e.PostId).HasColumnName("postID");

                entity.Property(e => e.Area).HasColumnName("area");

                entity.Property(e => e.Contact)
                    .HasMaxLength(50)
                    .HasColumnName("contact");

                entity.Property(e => e.FinishDay)
                    .HasColumnType("datetime")
                    .HasColumnName("finishDay");

                entity.Property(e => e.Img1)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("img1");

                entity.Property(e => e.Img2)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("img2");

                entity.Property(e => e.Img3)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("img3");

                entity.Property(e => e.RentalTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("rentalTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.StartDay)
                    .HasColumnType("datetime")
                    .HasColumnName("startDay");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasDefaultValueSql("('False')");

                entity.Property(e => e.Title)
                    .HasMaxLength(50)
                    .HasColumnName("title");

                entity.Property(e => e.UserName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("userName")
                    .IsFixedLength(true);

                entity.Property(e => e.Video)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("video");

                entity.Property(e => e.Address)
                    .HasMaxLength(500)
                    .HasColumnName("address");

                entity.Property(e => e.RentalPrice).HasColumnName("rentalPrice");

                entity.HasOne(d => d.RentalType)
                    .WithMany(p => p.TblPosts)
                    .HasForeignKey(d => d.RentalTypeId)
                    .HasConstraintName("FK_tblPost_tblRentalType");

                entity.HasOne(d => d.UserNameNavigation)
                    .WithMany(p => p.TblPosts)
                    .HasForeignKey(d => d.UserName)
                    .HasConstraintName("FK_tblPost_tblUser");
            });

            modelBuilder.Entity<TblReceipt>(entity =>
            {
                entity.HasKey(e => new { e.RoomId, e.Month });

                entity.ToTable("tblReceipt");

                entity.Property(e => e.RoomId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomID")
                    .IsFixedLength(true);

                entity.Property(e => e.Month)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("month")
                    .IsFixedLength(true);

                entity.Property(e => e.Debt).HasColumnName("debt");

                entity.Property(e => e.EletricFee).HasColumnName("eletricFee");

                entity.Property(e => e.Note)
                    .HasMaxLength(50)
                    .HasColumnName("note");

                entity.Property(e => e.OtherFee).HasColumnName("otherFee");

                entity.Property(e => e.RoomFee).HasColumnName("roomFee");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.WaterFee).HasColumnName("waterFee");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.TblReceipts)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblReceipt_room");
            });

            modelBuilder.Entity<TblRentalType>(entity =>
            {
                entity.HasKey(e => e.RentalTypeId)
                    .HasName("PK_rentalType");

                entity.ToTable("tblRentalType");

                entity.Property(e => e.RentalTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("rentalTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.Icon)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("icon");

                entity.Property(e => e.RentalTypeName)
                    .HasMaxLength(50)
                    .HasColumnName("rentalTypeName");
            });

            modelBuilder.Entity<TblRoom>(entity =>
            {
                entity.HasKey(e => e.RoomId)
                    .HasName("PK_room");

                entity.ToTable("tblRoom");

                entity.Property(e => e.RoomId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomID")
                    .IsFixedLength(true);

                entity.Property(e => e.Address)
                    .HasMaxLength(150)
                    .HasColumnName("address");

                entity.Property(e => e.CurrentQuantity).HasColumnName("currentQuantity");

                entity.Property(e => e.ElectricNo).HasColumnName("electricNo");

                entity.Property(e => e.Location)
                    .HasMaxLength(50)
                    .HasColumnName("location");

                entity.Property(e => e.MaxQuantity).HasColumnName("maxQuantity");

                entity.Property(e => e.RoomPrice)
                    .HasColumnType("money")
                    .HasColumnName("roomPrice");

                entity.Property(e => e.RoomTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.StatusId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("statusID")
                    .IsFixedLength(true);

                entity.Property(e => e.UserTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("userTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.WaterNo).HasColumnName("waterNo");

                entity.HasOne(d => d.RoomType)
                    .WithMany(p => p.TblRooms)
                    .HasForeignKey(d => d.RoomTypeId)
                    .HasConstraintName("FK_room_roomType");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.TblRooms)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_room_status");

                entity.HasOne(d => d.UserType)
                    .WithMany(p => p.TblRooms)
                    .HasForeignKey(d => d.UserTypeId)
                    .HasConstraintName("FK_tblRoom_tblUserType");
            });

            modelBuilder.Entity<TblRoomDetail>(entity =>
            {
                entity.HasKey(e => new { e.RoomId, e.CustomerIdnumber })
                    .HasName("PK_roomDetal_1");

                entity.ToTable("tblRoomDetail");

                entity.Property(e => e.RoomId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomID")
                    .IsFixedLength(true);

                entity.Property(e => e.CustomerIdnumber)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("customerIDNumber")
                    .IsFixedLength(true);

                entity.Property(e => e.FinishDay)
                    .HasColumnType("date")
                    .HasColumnName("finishDay");

                entity.Property(e => e.RentDay)
                    .HasColumnType("date")
                    .HasColumnName("rentDay");

                entity.HasOne(d => d.CustomerIdnumberNavigation)
                    .WithMany(p => p.TblRoomDetails)
                    .HasForeignKey(d => d.CustomerIdnumber)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblRoomDetail_tblRoomDetail");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.TblRoomDetails)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_roomDetal_room");
            });

            modelBuilder.Entity<TblRoomType>(entity =>
            {
                entity.HasKey(e => e.RoomTypeId)
                    .HasName("PK_roomType");

                entity.ToTable("tblRoomType");

                entity.Property(e => e.RoomTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.RoomName)
                    .HasMaxLength(50)
                    .HasColumnName("roomName");
            });

            modelBuilder.Entity<TblScreen>(entity =>
            {
                entity.HasKey(e => e.ScreenId);

                entity.ToTable("tblScreen");

                entity.Property(e => e.ScreenId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("screenID")
                    .IsFixedLength(true);

                entity.Property(e => e.ScreenName)
                    .HasMaxLength(50)
                    .HasColumnName("screenName");
            });

            modelBuilder.Entity<TblStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId)
                    .HasName("PK_status");

                entity.ToTable("tblStatus");

                entity.Property(e => e.StatusId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("statusID")
                    .IsFixedLength(true);

                entity.Property(e => e.StatusName)
                    .HasMaxLength(50)
                    .HasColumnName("statusName");
            });

            modelBuilder.Entity<TblUser>(entity =>
            {
                entity.HasKey(e => e.UserName)
                    .HasName("PK_user");

                entity.ToTable("tblUser");

                entity.Property(e => e.UserName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("userName")
                    .IsFixedLength(true);

                entity.Property(e => e.Address)
                    .HasMaxLength(150)
                    .HasColumnName("address");

                entity.Property(e => e.Avatar)
                    .IsUnicode(false)
                    .HasColumnName("avatar");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.Gender)
                    .HasMaxLength(10)
                    .HasColumnName("gender")
                    .IsFixedLength(true);

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .HasMaxLength(10)
                    .HasColumnName("phone")
                    .IsFixedLength(true);

                entity.Property(e => e.Success).HasColumnName("success");

                entity.Property(e => e.UserTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("userTypeID")
                    .IsFixedLength(true);

                entity.HasOne(d => d.UserType)
                    .WithMany(p => p.TblUsers)
                    .HasForeignKey(d => d.UserTypeId)
                    .HasConstraintName("FK_user_userType");
            });

            modelBuilder.Entity<TblUserType>(entity =>
            {
                entity.HasKey(e => e.UserTypeId)
                    .HasName("PK_userType");

                entity.ToTable("tblUserType");

                entity.Property(e => e.UserTypeId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("userTypeID")
                    .IsFixedLength(true);

                entity.Property(e => e.UserTypeName)
                    .HasMaxLength(50)
                    .HasColumnName("userTypeName");
            });

            modelBuilder.Entity<TblWater>(entity =>
            {
                entity.HasKey(e => new { e.RoomId, e.Month });

                entity.ToTable("tblWater");

                entity.Property(e => e.RoomId)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("roomID")
                    .IsFixedLength(true);

                entity.Property(e => e.Month)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("month");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.NewNumber).HasColumnName("newNumber");

                entity.Property(e => e.OldNumber).HasColumnName("oldNumber");

                entity.Property(e => e.UPrice).HasColumnName("uPrice");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.TblWaters)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblWater_tblRoom");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
