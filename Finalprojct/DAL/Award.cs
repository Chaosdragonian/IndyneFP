namespace Finalprojct.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Award")]
    public partial class Award
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AwardID { get; set; }

        [Required]
        [StringLength(50)]
        public string AwardName { get; set; }

        [Required]
        public string AwardDesc { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactName { get; set; }

        public int ContactID { get; set; }

        public virtual Contact Contact { get; set; }
    }
}
