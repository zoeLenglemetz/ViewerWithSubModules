using Newtonsoft.Json;
using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class SyncBoxDbo
    {
        public string id;
        public string junctionId;
        public string[] featureIds;
        public float[] durations;

        public SyncBoxDbo(string id, string junctionId, string[] featureIds, float[] durations)
        {
            this.id = id;
            this.junctionId = junctionId;
            this.featureIds = featureIds;
            this.durations = durations;
        }
    }
}
