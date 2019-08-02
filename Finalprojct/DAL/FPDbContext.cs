namespace Finalprojct.DAL
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class FPDbContext : DbContext
    {
        public FPDbContext()
            : base("name=FPDbContext")
        {
        }

        public virtual DbSet<Award> Awards { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Github> Githubs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Award>()
                .Property(e => e.AwardName)
                .IsUnicode(false);

            modelBuilder.Entity<Award>()
                .Property(e => e.AwardDesc)
                .IsUnicode(false);

            modelBuilder.Entity<Award>()
                .Property(e => e.ContactName)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.Github)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .HasMany(e => e.Awards)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => new { e.ContactID, e.ContactName })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Contact>()
                .HasMany(e => e.Githubs)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => new { e.ContactID, e.ContactName })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Github>()
                .Property(e => e.Gitaddress)
                .IsUnicode(false);

            modelBuilder.Entity<Github>()
                .Property(e => e.ContactName)
                .IsUnicode(false);
        }
    }
}
