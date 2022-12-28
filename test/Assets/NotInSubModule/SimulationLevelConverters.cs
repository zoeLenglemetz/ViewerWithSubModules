using TheGoodDrive.Data.Dbo;
using TheGoodDrive.Data.Dto;

namespace TheGoodDrive.Data.Converters
{
    public static class SimulationLevelConverters
    {
        public static SimulationLevelDbo ToSimulationLevelDbo(this SimulationLevelDtoResponse simulationLevelDtoResponse) => new SimulationLevelDbo(
            simulationLevelDtoResponse.mapDto.ToMapDbo(),
            simulationLevelDtoResponse.settings.ToSettingsDbo()
        );
    }
}