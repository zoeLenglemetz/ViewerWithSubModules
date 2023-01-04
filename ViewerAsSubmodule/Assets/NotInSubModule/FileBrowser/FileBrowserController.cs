using System.Collections;
using UnityEngine;
using Utils.Services;
using TheGoodDrive.Data.Dto;
using TheGoodDrive.Data.Dbo;
using TheGoodDrive.Data.Converters;
using System.IO;
using TheGoodDrive.Builders;
using TheGoodDrive.Data.ScriptableObjects.Configurations;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System;
using SimpleFileBrowser;
using TheGoodDrive.Data.ScriptableObjects.Configurations.Debug;

namespace TheGoodDrive.UI
{
    public class FileBrowserController : MonoBehaviour
    {
        [SerializeField] ConfigScriptableObject configScriptableObject;
        private DebugScriptableObject debugScriptableObject;
        private readonly IOJsonFileService ioJsonFileService = new IOJsonFileService();
        public static int actualVersion = 5; // variable sayiong in wich version we are actually
        public dynamic datasFromFileObject;
        public VersionManager versionManager;
        private void OnEnable()
        {
            #if !UNITY_EDITOR
                this.gameObject.SetActive(false);
            #endif
        }

        public void ReadCompiledFile()
        {
            // Debug.Log("READ");
            StartCoroutine(LaunchRead());
        }

        /// <summary>
        /// Prototype of method that on a map browser read
        /// </summary>
        public delegate void OnFileBrowserMapLoadHandler(SimulationLevelDbo simulationLevelDbo);
        public static event OnFileBrowserMapLoadHandler OnFileBrowserSimulationLevelLoadEvent;

        void Start()
        {
        /*  //  debugScriptableObject = Resources.Load<DebugScriptableObject>("DebugSettings");
            // Set filters (optional)
            // It is sufficient to set the filters just once (instead of each time before showing the file browser dialog), 
            // if all the dialogs will be using the same filters
            FileBrowser.SetFilters(true, new FileBrowser.Filter("JSON", ".json"));

            // Set default filter that is selected when the dialog is shown (optional)
            // Returns true if the default filter is set successfully
            // In this case, set Images filter as the default filter
            // FileBrowser.SetDefaultFilter(".json");

            // Set excluded file extensions (optional) (by default, .lnk and .tmp extensions are excluded)
            // Note that when you use this function, .lnk and .tmp extensions will no longer be
            // excluded unless you explicitly add them as parameters to the function
            FileBrowser.SetExcludedExtensions(".lnk", ".tmp", ".zip", ".rar", ".exe");

            // Add a new quick link to the browser (optional) (returns true if quick link is added successfully)
            // It is sufficient to add a quick link just once
            // Name: Users
            // Path: C:\Users
            // Icon: default (folder icon)
            FileBrowser.AddQuickLink("Users", "C:\\Users", null);
            Debug.Log($"Ici {configScriptableObject.DebugConfig.FileToLoad}");
            debugScriptableObject = configScriptableObject.DebugConfig;

            //DEFAULT MAP
            if (debugScriptableObject.LoadMapOnPlay)
            {
                versionManager = new VersionManager();
                datasFromFileObject = versionManager.VersionControl(actualVersion, debugScriptableObject.FileToLoad); // check and upgrade if necessary the file to the lastest version handled

                SimulationLevelDtoResponse simulationLevelDto = JsonConvert.DeserializeObject<SimulationLevelDtoResponse>(datasFromFileObject);
                SimulationLevelDbo simulationLevelDbo = simulationLevelDto.ToSimulationLevelDbo();

               // configScriptableObject.SimulationLevelSequencer.SimulationLevelDbo = simulationLevelDbo;

                OnFileBrowserSimulationLevelLoadEvent?.Invoke(simulationLevelDbo);
                BuildSimulationLevelEventsManager.OnGenerateSimulationLevel(simulationLevelDbo);*/
            }
        }

        IEnumerator LaunchRead()
        {
            yield return FileBrowser.WaitForLoadDialog(FileBrowser.PickMode.FilesAndFolders, false, PlayerPrefs.GetString("LastBrowsePath"), null, "Load Files and Folders", "Load");

            if (FileBrowser.Success)
            {

                // FIXME
                string filename = FileBrowser.Result[0];

                PlayerPrefs.SetString("LastBrowsePath", Path.GetDirectoryName(FileBrowser.Result[0]));

                versionManager = new VersionManager();
                datasFromFileObject = versionManager.VersionControl(actualVersion, filename); // check and upgrade if necessary the file to the lastest version handled


                SimulationLevelDtoResponse simulationLevelDto = JsonConvert.DeserializeObject<SimulationLevelDtoResponse>(datasFromFileObject);
                SimulationLevelDbo simulationLevelDbo = simulationLevelDto.ToSimulationLevelDbo();

                configScriptableObject.SimulationLevelSequencer.SimulationLevelDbo = simulationLevelDbo;

                OnFileBrowserSimulationLevelLoadEvent?.Invoke(simulationLevelDbo);
                BuildSimulationLevelEventsManager.OnGenerateSimulationLevel(simulationLevelDbo);
                //Instantiate(speaker);
             //   configScriptableObject.CurrentSequencer.PlayScene(true);
            }
        }
    }
}