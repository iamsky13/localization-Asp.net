using System;
using System.Collections.Generic;

namespace navbar.Models
{
    public partial class LocalizationDetail
    {
        public int Id { get; set; }
        public string LocalizedName { get; set; }
        public int NavId { get; set; }

        public NavMenu Nav { get; set; }
    }
}
