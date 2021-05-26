using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _9GAG_Models
{
    public class Chat:Sectie
    { 
        public string Topic { get; set; }
        
        public string InhoudChat { get; set; }

        public string Foto
        {
            get { return Foto; }
            set { FotoBinary = value; }
        }

        //constructor
        
        public Chat(string topic, string Inhoudchat, string foto) 
        {
            this.Topic = topic;
            this.InhoudChat = Inhoudchat;
            this.Foto = foto;
        }

        public override string Valideer(string propertynaam)
        {
            if (propertynaam == nameof(Topic) && string.IsNullOrWhiteSpace(Topic))
            {
                return "Topic is een verplicht veld!";
            }
            if (propertynaam == nameof(Foto) && string.IsNullOrWhiteSpace(Foto))
            {
                return "FotoBinary is een verplicht veld!";
            }


            return base.Valideer(propertynaam);
        }
    }
}
