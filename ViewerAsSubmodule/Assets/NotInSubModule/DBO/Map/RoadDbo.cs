using System.Collections.Generic;
using TheGoodDrive.Data.CirculationTypes;

namespace TheGoodDrive.Data.Dbo
{
    public class RoadDbo
    {
        public List<LaneDbo> lanesDbo;
        public SpeedLimitDbo globalSpeedLimit;
        public List<SideMarking> sideMarkings;

        public RoadDbo(List<LaneDbo> lanesDbo, SpeedLimitDbo globalSpeedLimit, List<SideMarking> sideMarkings)
        {
            this.lanesDbo = lanesDbo;
            this.globalSpeedLimit = globalSpeedLimit;
            this.sideMarkings = sideMarkings;
        }
    }
}