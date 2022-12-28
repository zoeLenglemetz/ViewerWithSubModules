using System.Collections.Generic;
using SimuEdit.Data.Map;
using TheGoodDrive.Data.CirculationTypes;
using UnityEngine;

namespace TheGoodDrive.Data.Dto
{
    public class MapDtoResponse
    {
        public GpsDisplayDtoResponse gpsDisplay;
        public float startingScore;
        public ScoreCriteriasDtoResponse scoreCriterias;
        public List<RoadDtoResponse> roads;
        public Environment environment;
        public FeatureSetDtoResponse featureSets;
        public List<BorderDtoResponse> borders;
        public bool set;

        public class GpsDisplayDtoResponse
        {
            public bool activated;
            public bool speedLimits;
        }

        public class ScoreCriteriasDtoResponse
        {
            public ScoreCriteriaElementDtoResponse position;
            public ScoreCriteriaPaceDtoResponse pace;
            public ScoreCriteriaElementDtoResponse mirrors;
            public ScoreCriteriaElementDtoResponse look;
            public ScoreCriteriaElementDtoResponse ecoDriving;
            public ScoreCriteriaElementDtoResponse turnSignals;

            public class ScoreCriteriaElementDtoResponse
            {
                public bool activated;
                public float score;
            }

            public class ScoreCriteriaPaceDtoResponse
            {
                public bool speedFeedbacks;
                public bool activated;
                public float score;
            }
        }

        public class FeatureSetDtoResponse
        {
            public List<PanelDtoResponse> panels;
            public List<SyncBoxDtoResponse> syncBoxes;
            public List<TrafficLightDtoResponse> trafficLights;
            public List<GroundLineDtoResponse> groundLines;

            public class PanelDtoResponse
            {
                public PanelType[] types;
                public Vector3 position;
                public Vector3 dir;
                public string id;
                public string linkId;
            }

            public class SyncBoxDtoResponse
            {
                public string id;
                public string junctionId;
                public string[] featureIds;
                public float[] durations;
            }

            public class GroundLineDtoResponse
            {
                public GroundLineType type;

                public Vector3 startPosition;
                public Vector3 endPosition;
                public float width;
                public string id;
                public string featureId;
                public Vector3 dir;
            }

            public class TrafficLightDtoResponse
            {
                public TrafficLightType type;
                public Vector3 position;
                public Vector3 dir;
                public string syncBoxId;
                public int groupId;
                public bool hasPedestrian;
                public bool hasMini;
                public string id;
            }
        }

        public class RoadDtoResponse
        {
            public List<LaneDtoResponse> lanes;
            public SpeedLimitDtoResponse globalSpeedLimit;
            public List<SideMarking> sideMarkings;

            public class LaneDtoResponse
            {
                public List<NodeDtoResponse> nodes;

                public class NodeDtoResponse
                {
                    public string id;
                    public string roadId;
                    public string junctionId;
                    public List<SideMarking> sideMarkings;
                    public CentralMarking centralMarking;
                    public TrafficType trafficType;
                    public SpeedLimitDtoResponse speedLimit;
                    
                    public Vector3 position;
                    public string laneId;
                    public int nodeIndex;
                    public string nodeId;
                    public bool upwise;
                    public string type;
                    public int roadConnectionCount;

                    public List<NextDtoResponse> nexts;
                    public List<NodeDtoResponse> connections;
                    public List<FreePanelDtoResponse> freepanels;
                    public List<PropDtoResponse> props;

                    public class NextDtoResponse
                    {
                        public string nodeId;
                        public string roadId;
                        public string laneId;
                    }

                    public class FreePanelDtoResponse
                    {
                        public string id;
                        public string panelId;
                        public bool isUpwise;
                        public Vector2 offset;
                        public Vector3 position;
                        public Vector3 rotation;
                        public int speed;
                    }

                    public class PropDtoResponse
                    {
                        public string id;
                        public string propId;
                        public bool isUpwise;
                        public Vector2 offset;
                        public Vector3 position;
                        public Vector3 rotation;
                    }
                }


            }

            public class SpeedLimitDtoResponse
            {
                public int speed;
                
                public LimitType limitType;
            }
        }

        public class BorderDtoResponse
        {
            public string renderer;
            public List<BorderNodeDtoResponse> nodes;

            public class BorderNodeDtoResponse
            {
                public Vector3 position;
                public Vector3 norm;
                public string renderProps;
                public bool isCorner;
            }
        }
    }
}