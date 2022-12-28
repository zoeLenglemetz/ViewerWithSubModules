using TheGoodDrive.Data.CirculationTypes;
using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class PanelDbo
    {
        public Vector3 position;
        public Vector3 dir;

        public PanelType[] panelTypes;
        public string id;
        public string linkId;

        public PanelDbo(string id, Vector3 position, Vector3 dir, PanelType[] panelTypes, string linkId)
        {
            this.id = id;
            this.position = position;
            this.dir = dir;
            this.panelTypes = panelTypes;
            this.linkId = linkId;
        }
    }
}