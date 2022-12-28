using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class BorderNodeDbo
    {
        public string renderProps;
        public Vector3 position;
        public Vector3 norm;
        public bool isCorner;

        public BorderNodeDbo(string renderProps, Vector3 position, Vector3 norm, bool isCorner)
        {
            this.renderProps = renderProps;
            this.position = position;
            this.norm = norm;
            this.isCorner = isCorner;
        }
    }
}