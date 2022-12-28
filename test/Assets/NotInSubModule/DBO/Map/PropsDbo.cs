using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class PropDbo
    {
        public string id;
        public string propId;
        public bool isUpwise;
        public Vector2 offset;
        public Vector3 position;
        public Vector3 rotation;
        public PropDbo(string id, string propId, bool isUpwise, Vector2 offset, Vector3 position, Vector3 rotation)
        {
            this.id = id;
            this.propId = propId;
            this.isUpwise = isUpwise;
            this.offset = offset;
            this.position = position;
            this.rotation = rotation;
        }
    }
}