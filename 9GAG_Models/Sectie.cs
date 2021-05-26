using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _9GAG_Models
{
    public class Sectie:Post
    {
        public string Naam;
        public string FotoBinary;
        public DateTime Date;
        





        //constructor

        public override string Valideer(string propertynaam)
        {
            if (propertynaam == nameof(Naam) && string.IsNullOrWhiteSpace(Naam))
            {
                return "Naam is een verplicht veld!";
            }
            if (propertynaam == nameof(FotoBinary) && string.IsNullOrWhiteSpace(FotoBinary))
            {
                return "FotoBinary is een verplicht veld!";
            }


            return "";
        }
    }

}
