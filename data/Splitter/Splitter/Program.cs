using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Splitter
{
    using System.IO;
    using System.Text.RegularExpressions;

    class Program
    {
        private static string BaseDirectory
        {
            get
            {
                return AppDomain.CurrentDomain.BaseDirectory;
            }
        }

        static void Main(string[] args)
        {
            string file_name;
            if (args.Length > 0)
            {
                file_name = args[0];
            }
            else
            {
                file_name = "eposition_1.txt";                
            }

            var withoutExtension = file_name.Split('.')[0];
            string directoryPath = string.Format("{0}/{1}", BaseDirectory, withoutExtension);
            Directory.CreateDirectory(directoryPath);
            var something = new StreamReader(BaseDirectory + "/" + file_name);

            bool dataStarts = false;
            var regex = new Regex("(\\d\\.{0,1}\\d*\\s*){5,6}");
            List<string> current_case = new List<string>();
            string line = string.Empty;
            int counter = 0;
            while ((line = something.ReadLine()) != null)
            {
                if (regex.IsMatch(line) && !dataStarts)
                {
                    dataStarts = true;
                    Console.WriteLine("uray!");
                }

                if (!dataStarts)
                {
                    continue;
                }

                if (string.IsNullOrWhiteSpace(line))
                {
                    counter++;
                    SaveCase(current_case, file_name, directoryPath);
                    current_case = new List<string>();
                    continue;
                }

                current_case.Add(line);
            }
        }

        private static void SaveCase(List<string> currentCase, string fileName, string directoryPath)
        {
            currentCase.Remove(currentCase[1]);
            int nodeId = GetNodeId(currentCase.First());
            File.WriteAllLines(Path(nodeId, fileName, directoryPath), currentCase);
        }

        private static string Path(int nodeId, string fileName, string directoryPath)
        {
            int counter = 1;
            string path = Path(nodeId, fileName, directoryPath, counter);
            while (File.Exists(path))
            {
                counter++;
                path = Path(nodeId, fileName, directoryPath, counter);
            }

            return path;
        }

        private static string Path(int nodeId, string fileName, string directoryPath, int counter)
        {
            var path = string.Format("{0}/{1}_Node{2}_{3}.txt", directoryPath, fileName, nodeId, counter);
            return path;
        }

        private static int GetNodeId(string firstLine)
        {
            var splitted = firstLine.Split(Convert.ToChar(" "));
            return int.Parse(splitted[1]);
        }
    }
}
