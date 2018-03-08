using System;
using System.Collections.Generic;

namespace navbar.Models
{
    public partial class NavMenu
    {
        public NavMenu()
        {
            LocalizationDetail = new HashSet<LocalizationDetail>();
        }

        public int Id { get; set; }
        public string NavName { get; set; }
        public int Rank { get; set; }

        public ICollection<LocalizationDetail> LocalizationDetail { get; set; }
    }
}
