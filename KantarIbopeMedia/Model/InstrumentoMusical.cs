using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KantarIbopeMedia.Model
{
    public class InstrumentoMusical
    {
        public string marca;
        public string modedo;
        public DateTime dataFabricacao;
        public string Cor;
        public void Tocar()
        {
            Console.WriteLine("Tocar "+ this.GetType().Name);
        }
        public void Afinar(InstrumentoMusical instrumento)
        {
            instrumento.Tocar();
        }
    }
}
