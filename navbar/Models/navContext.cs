using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace navbar.Models
{
    public partial class navContext : DbContext
    {
        public virtual DbSet<Language> Language { get; set; }
        public virtual DbSet<LocalizationDetail> LocalizationDetail { get; set; }
        public virtual DbSet<NavMenu> NavMenu { get; set; }
        public virtual DbSet<vw_localization> vw_localization { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer(@"Server=.;Database=nav;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Language>(entity =>
            {
                entity.ToTable("language");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .HasColumnName("code")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Language1)
                    .IsRequired()
                    .HasColumnName("language")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<LocalizationDetail>(entity =>
            {
                entity.ToTable("localization_detail");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.LocalizedName)
                    .IsRequired()
                    .HasColumnName("localized_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NavId).HasColumnName("nav_id");

                entity.HasOne(d => d.Nav)
                    .WithMany(p => p.LocalizationDetail)
                    .HasForeignKey(d => d.NavId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__localizat__nav_i__25869641");
            });

            modelBuilder.Entity<NavMenu>(entity =>
            {
                entity.ToTable("nav_menu");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.NavName)
                    .IsRequired()
                    .HasColumnName("nav_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Rank).HasColumnName("rank");
            });

            modelBuilder.Entity<vw_localization>(entity => { entity.HasKey(x => x.localization_id); });
        }
    }
}
