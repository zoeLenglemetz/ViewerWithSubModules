using System.Collections.Generic;
using TheGoodDrive.Data.CirculationTypes;

namespace TheGoodDrive.Data.Dbo
{
    public class LaneDbo
    {
        public List<NodeDbo> nodesDbo;
        public bool isUpwise;
        public TrafficType trafficType;
        public SpeedLimitDbo speedLimitDbo;
        public CentralMarking centralMarking;

        public LaneDbo(
            List<NodeDbo> nodesDbo
        )
        {
            this.nodesDbo = nodesDbo;
        }
    }
}