using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class FreePanelDbo
    {
        public string id;
        public string panelId;
        public bool isUpwise;
        public Vector2 offset;
        public Vector3 position;
        public Vector3 rotation;
        public int speed;
        public FreePanelDbo(string id, string panelId, bool isUpwise, Vector2 offset, Vector3 position, Vector3 rotation, int speed)
        {
            this.id = id;
            this.panelId = panelId;
            this.isUpwise = isUpwise;
            this.offset = offset;
            this.position = position;
            this.rotation = rotation;
            this.speed = speed;
        }
    }
}