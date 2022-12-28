using System;
using TheGoodDrive.Data.Dbo;
using TheGoodDrive.Data.Dto;
using UnityEngine;

namespace TheGoodDrive.Data.Converters
{
    public static class SettingsConverters
    {
        public static SettingsDbo ToSettingsDbo(this SetingsDtoResponse settingsDtoResponse
            ) => new SettingsDbo(
            settingsDtoResponse.roadElevation.ToSettingsDataDbo()
        );

        private static RoadElevationDbo ToSettingsDataDbo(this SetingsDtoResponse.RoadElevationDataResponse roadElevationDataResponse
        ) => new RoadElevationDbo(
            roadElevationDataResponse.height
        );
    }
}
