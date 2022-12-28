using System.Collections.Generic;
using System.Linq;
using TheGoodDrive.Data.Dbo;
using UnityEngine;
//using TheGoodDrive.Data.Types;
using TheGoodDrive.Data.ScriptableObjects.Configurations;

namespace TheGoodDrive.Data.ScriptableObjects.Sequencers
{
    [CreateAssetMenu(menuName = "Sequencers/SimulationLevel", fileName = "SimulationLevelSequencer")]
    public class SimulationLevelSequencer : ScriptableObject
    {
      
        public SimulationLevelDbo SimulationLevelDbo { get; set; }

        public Terrain currentTerrain { get; set; }

        public Dictionary<string, NodeDbo> RoadNodes { get; } = new Dictionary<string, NodeDbo>();


        public SimulationLevelDbo simulationLevelDbo;

        public void KeepRoadNodeReferences(MapDbo mapDbo)
        {
            /*RoadNodes.Clear();
            foreach (NodeDbo nodeDbo in
                     from roadDbo in mapDbo.roadsDbo
                     from laneDbo in roadDbo.lanesDbo
                     from nodeDbo in laneDbo.nodesDbo
                     select nodeDbo)
            {
                RoadNodes.Add(nodeDbo.nodeId, nodeDbo);
            }*/
        }
        public void Quit()
        {
            Debug.Log("Quit button clicked");
        }

    }
}