using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Models
{
    public class UserDto
    {
        public required String Username {get; set;}

        public required String Password {get; set;} 
    }
}