namespace Splitter
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
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
            string fileName;
            if (args.Length > 0)
            {
                fileName = args[0];
            }
            else
            {
                fileName = "eposition_1.txt";    
            }

            var withoutExtension = fileName.Split('.')[0];
            string directoryPath = string.Format("{0}/{1}", BaseDirectory, withoutExtension);
            Directory.CreateDirectory(directoryPath);
            var something = new StreamReader(BaseDirectory + "/" + fileName);

            bool dataStarts = false;
            var regex = new Regex("(\\d\\.{0,1}\\d*\\s*){5,6}");
            List<string> current_case = new List<string>();
            string line = string.Empty;

            int counter = 0;
            StopWatch stopWatch = new StopWatch(true);
            double seconds;
            while ((line = something.ReadLine()) != null)
            {
                if (regex.IsMatch(line) && !dataStarts)
                {
                    dataStarts = true;
                    Console.WriteLine("starting!");
                }

                if (!dataStarts)
                {
                    continue;
                }

                if (string.IsNullOrWhiteSpace(line))
                {
                    counter++;
                    if (counter % 1000 == 0)
                    {
                        seconds = stopWatch.Seconds;
                        Console.WriteLine("{0} files writen. In {1} seconds.", counter, seconds); 
                        Console.WriteLine("Current rate {0} files/second.", counter / seconds);
                    }

                    SaveCase(current_case, withoutExtension, directoryPath);
                    current_case = new List<string>();
                    continue;
                }

                current_case.Add(line);
            }

            Console.WriteLine("Finished!");
            seconds = stopWatch.Seconds;
            Console.WriteLine("{0} files writen. In {1} seconds.", counter, seconds); 
        }

        private static void SaveCase(List<string> currentCase, string prefix, string directoryPath)
        {
            currentCase.Remove(currentCase[1]);
            int nodeId = GetNodeId(currentCase.First());
            string path = Path(nodeId, prefix, directoryPath);
            var asdf = new StreamWriter(path);

            foreach (var line in currentCase)
            {
                asdf.WriteLine(line);                
            }
            
            asdf.Flush();
            asdf.Dispose();
        }

        private static string Path(int nodeId, string prefix, string directoryPath)
        {
            if (!_idCounter.ContainsKey(nodeId))
            {
                _idCounter.Add(nodeId, 1);
            }

            int counter = _idCounter[nodeId]++;

            string path = Path(nodeId, prefix, directoryPath, counter);
            return path;
        }

        private static Dictionary<int, int> _idCounter = new Dictionary<int, int>(); 

        private static string Path(int nodeId, string prefix, string directoryPath, int counter)
        {
            var path = string.Format("{0}/{1}_Node{2}_{3}.txt", directoryPath, prefix, nodeId, counter);
            return path;
        }

        private static int GetNodeId(string firstLine)
        {
            var splitted = firstLine.Split(Convert.ToChar(" "));
            return int.Parse(splitted[1]);
        }
    }
}
