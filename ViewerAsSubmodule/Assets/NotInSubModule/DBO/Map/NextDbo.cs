namespace TheGoodDrive.Data.Dbo
{
    public class NextDbo
    {
        public string nodeId;
        public string roadId;
        public string laneId;

        public NextDbo(string nodeId, string roadId, string laneId)
        {
            this.nodeId = nodeId;
            this.roadId = roadId;
            this.laneId = laneId;
        }
    }
}