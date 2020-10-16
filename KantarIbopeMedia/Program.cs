using KantarIbopeMedia.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KantarIbopeMedia
{
    class Program
    {
        static void Main(string[] args)
        {

            //exercicio  Algoritimos 1 a)
            
            int[] vetor={ 2,5,7,3,8,9,1,4,6};

                for (int j = 1; j < vetor.Length; ++j)
                {
                    int x = vetor[j];
                    int i;
                    for (i = j - 1; i >= 0 && vetor[i] > x; --i)
                        vetor[i + 1] = vetor[i];
                    vetor[i + 1] = x;
                }
            foreach (var item in vetor)
            {
                Console.WriteLine(item);
            }


            //exercicio Algoritimos  1 b)
            int? max = 0, min = 0, cont = 0, soma =0, media;
            Console.WriteLine(" Ler o arquivo.");
            
            string text = System.IO.File.ReadAllText(@"..\..\..\testeIn.txt");
          
            //Lê cada linha do arquivo em um array de string.
            //Cada elemento do array é uma linha do arquivo.

            string[] linhas = System.IO.File.ReadAllLines(@"..\..\..\testeIn.txt");

            
            System.Console.WriteLine("Conteúdo do testeIn.txt : \n");

            foreach (string linha in linhas)
            {
                Console.WriteLine(linha);
                if ( int.Parse(linha) > max)
                {
                     max = int.Parse(linha);
                }
                cont++;
                soma += int.Parse(linha);
            }
            media = soma / cont;
            min = max;
            foreach (var item in linhas)
            {
                if (int.Parse(item) < min)
                {
                    min = int.Parse(item);
                }

            }

            Console.WriteLine("max :   {0}, min: {1} \n", max, min);
            Console.WriteLine("Soma  {0}, total de linhas:{1} \n a media é  {2}", soma, cont,media);
            string[] saida = { max.ToString(), min.ToString(), soma.ToString(), media.ToString() };         
            System.IO.File.WriteAllLines(@"..\..\..\testeOut.txt", saida);



            //Exercicio 2 Orientação a objetos



            var instrumento = new Violao();
            instrumento.Tocar();
            instrumento.Afinar(instrumento);

        }
    }
}
