using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class SettingsDbo
    {
        public RoadElevationDbo roadElevation;
        public SettingsDbo(RoadElevationDbo roadElevation)
        {
            this.roadElevation = roadElevation;
        }

    }
}