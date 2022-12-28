using System.Collections.Generic;
using TheGoodDrive.Data.CirculationTypes;
using UnityEngine;

namespace TheGoodDrive.Data.Dbo
{
    public class NodeDbo
    {
        public string id;
        public string roadId;
        public string junctionId;
        public List<SideMarking> sideMarkings;
        public CentralMarking? centralMarking;
        public TrafficType? trafficType;
        public SpeedLimitDbo speedLimitDbo;

        public Vector3 position;

        public string laneId;
        public int nodeIndex;
        public string nodeId;
        public bool upwise;
        public string type;
        public List<NextDbo> nexts;
        public List<NodeDbo> connections;
        public List<FreePanelDbo> freepanels;
        public List<PropDbo> props;
        public int roadConnectionCount;

        //Lite version to compute next positions of AI 
        public NodeDbo(Vector3 position, bool upwise)
        {
            this.position = position;
            this.upwise = upwise;
        }

        /// <summary>
        /// Create a node dbo
        /// </summary>
        /// <param name="id">Id of the node</param>
        /// <param name="roadId">Id of the parent road</param>
        /// <param name="junctionId">Id of the junction</param>
        /// <param name="sideMarkings">Side markings of the road</param>
        /// <param name="centralMarkings">Central markings of the road</param>
        /// <param name="position">The position of the node</param>
        /// <param name="laneId">the lane index in the road in the mega roads struct</param>
        /// <param name="nodeIndex">the node index in lane index in the road in the mega roads struct</param>
        /// <param name="nodeId">a unique node id</param>
        /// <param name="upwise">driving direction, upwise => drive from 0 to N</param>
        /// <param name="type">used for intermediate nodes</param>
        /// <param name="nexts">where to go from this node</param>
        /// <param name="connections">connected nodes</param>
        /// <param name="roadConnectionCount">number of connected roads, used for markings mainly</param>
        /// 
        public NodeDbo(
            string id, string roadId, string junctionId,
            List<SideMarking> sideMarkings,
            CentralMarking centralMarking,
            TrafficType trafficType,
            SpeedLimitDbo speedLimitDbo,
            Vector3 position,
            string laneId, int nodeIndex, string nodeId,
            bool upwise, string type,
            List<NextDbo> nexts,
            List<NodeDbo> connections,
            List<FreePanelDbo> freePanels,
            List<PropDbo> props,
            int roadConnectionCount
        )
        {
            this.id = id;
            this.roadId = roadId;
            this.junctionId = junctionId;
            this.sideMarkings = sideMarkings;
            this.centralMarking = centralMarking;
            this.trafficType = trafficType;
            this.speedLimitDbo = speedLimitDbo;
            this.position = position;
            this.laneId = laneId;
            this.nodeIndex = nodeIndex;
            this.nodeId = nodeId;
            this.upwise = upwise;
            this.type = type;
            this.nexts = nexts;
            this.connections = connections;
            this.freepanels = freePanels;
            this.props = props;
            this.roadConnectionCount = roadConnectionCount;
        }
    }
}