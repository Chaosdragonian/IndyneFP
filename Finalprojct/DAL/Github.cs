namespace Finalprojct.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Github")]
    public partial class Github
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int GitID { get; set; }

        [Required]
        public string Gitaddress { get; set; }

        public int ContactID { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactName { get; set; }

        public virtual Contact Contact { get; set; }
    }
}
