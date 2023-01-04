using System;
using UnityEngine;

namespace TheGoodDrive.Data.ScriptableObjects.Configurations.Debug
{
    [Serializable]
    [CreateAssetMenu(fileName = "Debug Settings", menuName = "Car/DebugSettings")]
    public class DebugScriptableObject: ScriptableObject
    {
        // General
        public bool Statistics;

        // Simulation startup
        public bool LoadMapOnPlay;
        public string FileToLoad = "./Levels/PlayGM10_E";

        // Simulation guizmos
        public bool IntersectionsGizmos;
        public bool PositionTrackerGizmos;
        public bool LineOverflowUI;
    }
}

