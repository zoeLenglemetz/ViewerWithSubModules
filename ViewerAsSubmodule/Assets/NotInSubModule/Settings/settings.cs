 public class RoadElevation
    {
        public float height;

        public RoadElevation(float height)
        {
            this.height = height;
        }
    }
    public class Settings
    {
        public RoadElevation roadElevation;

        public Settings (
            RoadElevation roadElevation)
            {
                this.roadElevation = roadElevation;
            }
    }