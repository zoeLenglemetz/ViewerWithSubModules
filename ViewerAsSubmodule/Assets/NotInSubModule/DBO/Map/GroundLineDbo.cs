using UnityEngine;
using TheGoodDrive.Data.CirculationTypes;

namespace TheGoodDrive.Data.Dbo
{
    public class GroundLineDbo
    {
        public string id;
        
        public Vector3 startPosition;
        public Vector3 endPosition;
        
        public GroundLineType type;
        public float width;
        public string featureId;
        public Vector3 dir;

        public GroundLineDbo(
            string id,
            Vector3 startPosition,
            Vector3 endPosition,
            GroundLineType type,
            float width,
            string featureId,
            Vector3 dir)
        {
            this.id = id;
            this.startPosition = startPosition;
            this.endPosition = endPosition;
            this.type = type;
            this.width = width;
            this.featureId = featureId;
            this.dir = dir;
        }
    }
}