using System.Collections.Generic;

namespace TheGoodDrive.Data.Dbo
{
    public class BorderDbo
    {
        public string renderer;
        public List<BorderNodeDbo> nodes;

        public BorderDbo(
            string renderer,
            List<BorderNodeDbo> nodes
        )
        {
            this.renderer = renderer;
            this.nodes = nodes;
        }
    }
}
