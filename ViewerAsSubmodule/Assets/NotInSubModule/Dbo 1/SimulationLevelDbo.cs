

namespace TheGoodDrive.Data.Dbo
{
    public class SimulationLevelDbo
    {
        public MapDbo map;
        public SettingsDbo settings;

        public SimulationLevelDbo(MapDbo map, SettingsDbo settings)
        {
            //gerer si setings null
            this.map = map;
            this.settings = settings;
        }
    }
}