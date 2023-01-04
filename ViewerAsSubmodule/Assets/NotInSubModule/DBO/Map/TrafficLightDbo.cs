using TheGoodDrive.Data.CirculationTypes;
using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class TrafficLightDbo
    {
        public Vector3 position;
        public Vector3 dir;

        public string id;

        public TrafficLightType type;
        public string syncBoxId;
        public int groupId;
        public bool hasPedestrian;
        public bool hasMini;

        public TrafficLightDbo(
            string id,
            Vector3 position,
            Vector3 dir,
            TrafficLightType type,
            string syncBoxId,
            int groupId,
            bool hasPedestrian,
            bool hasMini)
        {
            this.id = id;
            this.position = position;
            this.dir = dir;
            this.type = type;
            this.syncBoxId = syncBoxId;
            this.groupId = groupId;
            this.hasPedestrian = hasPedestrian;
            this.hasMini = hasMini;
        }
    }
}