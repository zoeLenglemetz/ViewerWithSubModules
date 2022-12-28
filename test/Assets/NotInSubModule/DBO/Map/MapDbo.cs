using System.Collections.Generic;
using SimuEdit.Data.Map;

namespace TheGoodDrive.Data.Dbo
{
    public class MapDbo
    {
        public float startingScore;
        public List<RoadDbo> roadsDbo;
        public Environment environment;
        public FeatureSetDbo featureSetDbo;
        public List<BorderDbo> bordersDbo;

        public MapDbo(float startingScore,  List<RoadDbo> roadsDbo, 
            Environment environment, FeatureSetDbo featureSetDbo, List<BorderDbo> bordersDbo)
        {
            this.startingScore = startingScore;
            this.roadsDbo = roadsDbo;
            this.environment = environment;
            this.featureSetDbo = featureSetDbo;
            this.bordersDbo = bordersDbo;
        }

    }
}