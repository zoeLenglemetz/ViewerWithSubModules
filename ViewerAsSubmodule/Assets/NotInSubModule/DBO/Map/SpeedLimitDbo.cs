using TheGoodDrive.Data.CirculationTypes;

namespace TheGoodDrive.Data.Dbo
{
    public class SpeedLimitDbo
    {
        public int speed; 
        public LimitType limitType;

        public SpeedLimitDbo(int speed, LimitType limitType)
        {
            this.speed = speed;
            this.limitType = limitType;
        }
    }
}