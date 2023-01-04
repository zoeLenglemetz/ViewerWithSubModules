using System.Collections.Generic;

namespace TheGoodDrive.Data.Dbo
{
    public class FeatureSetDbo
    {
        public List<PanelDbo> panels;
        public List<SyncBoxDbo> syncBoxes;
        public List<TrafficLightDbo> trafficLights;
        public List<GroundLineDbo> groundLines;

        public FeatureSetDbo(
            List<PanelDbo> panels,
            List<SyncBoxDbo> syncBoxes,
            List<TrafficLightDbo> trafficLights,
            List<GroundLineDbo> groundLines
        )
        {
            this.panels = panels;
            this.syncBoxes = syncBoxes;
            this.trafficLights = trafficLights;
            this.groundLines = groundLines;
        }
    }
}