using System.Collections.Generic;
using SimuEdit.Data.Map;
using TheGoodDrive.Data.CirculationTypes;
using UnityEngine;

namespace TheGoodDrive.Data.Dto
{
    public class SetingsDtoResponse
    {
        public RoadElevationDataResponse roadElevation;

        // public ScoreCriteriasDtoResponse scoreCriterias;

        public class RoadElevationDataResponse
        {
            public float height;
        }

    }
}