using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace navbar.Models
{
    public class vw_localization
    {
        public int nav_id { get; set; }
        public string nav_name { get; set; }
        public int rank { get; set; }
        [Key]
        public int localization_id { get; set; }
        public int language_id { get; set; }
        public string language { get; set; }
        public string code { get; set; }
        public string localized_name { get; set; }
    }
}
