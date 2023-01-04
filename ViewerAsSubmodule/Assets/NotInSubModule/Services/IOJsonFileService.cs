using System.IO;
using Newtonsoft.Json;
using UnityEngine;

namespace Utils.Services
{
    /// <summary>
    /// Service to manage json files
    /// </summary>
    public class IOJsonFileService
    {
        /// <summary>
        /// Delete the given JSON file
        /// </summary>
        /// <param name="fileName">The file to delete</param>
        public void Delete(string fileName)
        {
            string path = GetJsonFilePath(fileName);
            File.Delete(path);
            File.Delete($"{path}.meta");
            
            RefreshEditorProjectWindow();
        }

        /// <summary>
        /// Determine if the JSON file exist 
        /// </summary>
        /// <param name="fileName">The file to check</param>
        /// <returns>Return true if the file exists, false otherwise.</returns>
        public bool Exists(string fileName) => File.Exists(GetJsonFilePath(fileName));

        /// <summary>
        /// Read the JSON content of the JSON file and return it.
        /// </summary>
        /// <typeparam name="JsonType">The JSON type of the JSON to read</typeparam>
        /// <param name="fileName">The file to read</param>
        /// <returns>Returns the JSON object of the file</returns>
        public JsonType Read<JsonType>(string fileName)
        {
            string path = GetJsonFilePath(fileName);

            using StreamReader r = new StreamReader(path, System.Text.Encoding.UTF8);
            return JsonConvert.DeserializeObject<JsonType>(r.ReadToEnd());
        }

        /// <summary>
        /// Write the JSON object into the file
        /// </summary>
        /// <typeparam name="JsonType">The JSON type of the JSON to read</typeparam>
        /// <param name="fileName">The file where to write</param>
        /// <param name="json">The JSON object to write</param>
        /// <param name="append">Indicate if the json has to be written at the end</param>
        public void Write<JsonType>(string fileName, JsonType json, bool append = false)
        {
            string filePath = GetJsonFilePath(fileName);

            string directoryPath = GetJsonDirectoryPath(filePath);
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }
            using StreamWriter w = new StreamWriter(filePath, append, System.Text.Encoding.UTF8);
            w.WriteLine(JsonConvert.SerializeObject(json, Formatting.Indented));

            RefreshEditorProjectWindow();
        }
        
        public string GetJsonFilePath(string fileName)
        {
            if (File.Exists(Path.Combine(Application.streamingAssetsPath, $"{fileName}.json"))){
                return Path.Combine(Application.streamingAssetsPath, $"{fileName}.json");
            }
            else
            {
                return fileName;
            }
        }
        
        public string GetJsonDirectoryPath(string filePath)
        {
            int indexOfLastSlash = filePath.LastIndexOf('/');
            return filePath.Substring(0, indexOfLastSlash);
        }
        
        /// <summary>
        /// Refresh the project window in Unity
        /// </summary>
        private void RefreshEditorProjectWindow()
        {
#if UNITY_EDITOR
            UnityEditor.AssetDatabase.Refresh();
#endif
        }
    }
}