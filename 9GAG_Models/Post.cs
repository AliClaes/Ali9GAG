using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _9GAG_Models
{
    public class Post
    {
        public int Score;
        public string MediaBinary;
        public DateTime TijdVanPost;
        public string Comments;
        public Boolean Upvote;
        public string Titel;



        public override string Valideer(string propertynaam)
        {
            if (propertynaam == nameof(Titel) && string.IsNullOrWhiteSpace(Titel))
            {
                return "Titel is een verplicht veld!";
            }
            if (propertynaam == nameof(MediaBinary) && string.IsNullOrWhiteSpace(MediaBinary))
            {
                return "MediaBinary is een verplicht veld!";
            }
            

            return "";
        }
    }
}
