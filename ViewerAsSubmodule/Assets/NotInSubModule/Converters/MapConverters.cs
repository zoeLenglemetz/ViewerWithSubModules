using TheGoodDrive.Data.Dbo;
using TheGoodDrive.Data.Dto;

namespace TheGoodDrive.Data.Converters
{
    public static class MapConverters
    {
        /// <summary>
        /// Convert a map dto response into a map dbo
        /// </summary>
        /// <param name="mapDtoResponse">The map dto received</param>
        /// <returns>Returns the map dbo mapped from map dto</returns>
        public static MapDbo ToMapDbo(this MapDtoResponse mapDtoResponse) => new MapDbo(
            mapDtoResponse.startingScore,
            mapDtoResponse.roads.ConvertAll(ToRoadDbo),
            mapDtoResponse.environment,
            mapDtoResponse.featureSets.ToFeatureSetDbo(),
            mapDtoResponse.borders.ConvertAll(ToBorderDbo)
        );


        private static RoadDbo ToRoadDbo(this MapDtoResponse.RoadDtoResponse roadDtoResponse) => new RoadDbo(
            lanesDbo: roadDtoResponse.lanes.ConvertAll(ToLaneDbo),
            globalSpeedLimit: roadDtoResponse.globalSpeedLimit.ToSpeedLimitDbo(),
            sideMarkings: roadDtoResponse.sideMarkings
        );

        private static LaneDbo ToLaneDbo(this MapDtoResponse.RoadDtoResponse.LaneDtoResponse laneDtoResponse) =>
            new LaneDbo(
                nodesDbo: laneDtoResponse.nodes.ConvertAll(ToNodeDbo)
            );

        private static NodeDbo ToNodeDbo(
            this MapDtoResponse.RoadDtoResponse.LaneDtoResponse.NodeDtoResponse nodeDtoResponse
        ) => new NodeDbo(
            id: nodeDtoResponse.id,
            roadId: nodeDtoResponse.roadId,
            junctionId: nodeDtoResponse.junctionId,
            sideMarkings: nodeDtoResponse.sideMarkings,
            centralMarking: nodeDtoResponse.centralMarking,
            trafficType: nodeDtoResponse.trafficType,
            speedLimitDbo: nodeDtoResponse.speedLimit.ToSpeedLimitDbo(),
            position: nodeDtoResponse.position,
            laneId: nodeDtoResponse.laneId,
            nodeIndex: nodeDtoResponse.nodeIndex,
            nodeId: nodeDtoResponse.nodeId,
            upwise: nodeDtoResponse.upwise,
            type: nodeDtoResponse.type,
            nexts: nodeDtoResponse.nexts.ConvertAll(ToNextDbo),
            connections: nodeDtoResponse.connections.ConvertAll(ToNodeDbo),
            freePanels: nodeDtoResponse.freepanels.ConvertAll(ToFreePanelDbo),
            props: nodeDtoResponse.props.ConvertAll(ToPropDbo),
            roadConnectionCount: nodeDtoResponse.roadConnectionCount
        );

        private static PropDbo ToPropDbo(
            this MapDtoResponse.RoadDtoResponse.LaneDtoResponse.NodeDtoResponse.PropDtoResponse propDtoResponse
            ) => new PropDbo(propDtoResponse.id, propDtoResponse.propId, propDtoResponse.isUpwise, propDtoResponse.offset, propDtoResponse.position, propDtoResponse.rotation);

        private static FreePanelDbo ToFreePanelDbo(
            this MapDtoResponse.RoadDtoResponse.LaneDtoResponse.NodeDtoResponse.FreePanelDtoResponse freePanelDtoResponse
            ) => new FreePanelDbo(freePanelDtoResponse.id, freePanelDtoResponse.panelId, freePanelDtoResponse.isUpwise, freePanelDtoResponse.offset, freePanelDtoResponse.position, freePanelDtoResponse.rotation, freePanelDtoResponse.speed);

        private static NextDbo ToNextDbo(
            this MapDtoResponse.RoadDtoResponse.LaneDtoResponse.NodeDtoResponse.NextDtoResponse nextDtoResponse
        ) => new NextDbo(nextDtoResponse.nodeId, nextDtoResponse.roadId, nextDtoResponse.laneId);

        private static SpeedLimitDbo ToSpeedLimitDbo(
            this MapDtoResponse.RoadDtoResponse.SpeedLimitDtoResponse speedLimitDtoResponse
        ) => speedLimitDtoResponse == null ? null : new SpeedLimitDbo(speedLimitDtoResponse.speed, speedLimitDtoResponse.limitType);

        private static PanelDbo ToPanelDbo(this MapDtoResponse.FeatureSetDtoResponse.PanelDtoResponse panelDtoResponse)
            => new PanelDbo(panelDtoResponse.id, panelDtoResponse.position, panelDtoResponse.dir, panelDtoResponse.types, panelDtoResponse.linkId);

        private static SyncBoxDbo ToSyncBoxDbo(this MapDtoResponse.FeatureSetDtoResponse.SyncBoxDtoResponse syncBoxDtoResponse)
            => new SyncBoxDbo(syncBoxDtoResponse.id, syncBoxDtoResponse.junctionId, syncBoxDtoResponse.featureIds, syncBoxDtoResponse.durations);

        private static TrafficLightDbo ToTrafficLightDbo(this MapDtoResponse.FeatureSetDtoResponse.TrafficLightDtoResponse trafficLightDtoResponse)
            => new TrafficLightDbo(
                trafficLightDtoResponse.id,
                trafficLightDtoResponse.position,
                trafficLightDtoResponse.dir,
                trafficLightDtoResponse.type,
                trafficLightDtoResponse.syncBoxId,
                trafficLightDtoResponse.groupId,
                trafficLightDtoResponse.hasPedestrian,
                trafficLightDtoResponse.hasMini
        );

        private static GroundLineDbo ToGroundLineDbo(this MapDtoResponse.FeatureSetDtoResponse.GroundLineDtoResponse groundLineDtoResponse)
            => new GroundLineDbo(
                groundLineDtoResponse.id,
                groundLineDtoResponse.startPosition,
                groundLineDtoResponse.endPosition,
                groundLineDtoResponse.type,
                groundLineDtoResponse.width,
                groundLineDtoResponse.featureId,
                groundLineDtoResponse.dir
        );

        private static FeatureSetDbo ToFeatureSetDbo(this MapDtoResponse.FeatureSetDtoResponse featureSetDtoResponse
        ) => new FeatureSetDbo(
            featureSetDtoResponse.panels.ConvertAll(ToPanelDbo),
            featureSetDtoResponse.syncBoxes.ConvertAll(ToSyncBoxDbo),
            featureSetDtoResponse.trafficLights.ConvertAll(ToTrafficLightDbo),
            featureSetDtoResponse.groundLines.ConvertAll(ToGroundLineDbo)
        );

        private static BorderDbo ToBorderDbo(this MapDtoResponse.BorderDtoResponse borderDtoResponse) => new BorderDbo(
            borderDtoResponse.renderer,
            borderDtoResponse.nodes.ConvertAll(ToBorderNodeDbo)
        );

        private static BorderNodeDbo ToBorderNodeDbo(this MapDtoResponse.BorderDtoResponse.BorderNodeDtoResponse borderNodeDtoResponse) => new BorderNodeDbo(
            borderNodeDtoResponse.renderProps,
            borderNodeDtoResponse.position,
            borderNodeDtoResponse.norm,
            borderNodeDtoResponse.isCorner
        );
    }
}