using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;
using Utils.Services;

public class VersionManager : MonoBehaviour
{
    public static int actualVersionOfSoft = 4;
    public dynamic datasFromFileObject;
    delegate dynamic versionFormaterCheck(dynamic prevVersion);
    public dynamic VersionControl(string filename)
    {
        IOJsonFileService JsonService = new IOJsonFileService();
        string path = File.Exists(filename) ? filename : Application.dataPath + "/NotInSubModule" + filename; //a modifier
        using (StreamReader file = File.OpenText(path))
        using (JsonTextReader reader = new JsonTextReader(file))
        {
            datasFromFileObject = (JObject)JToken.ReadFrom(reader);
        }

       /* if (datasFromFileObject.version == null) // check if version exist or not , if not create it and instantiate the version var (before version 0 no version was in the files)
        {
            Debug.Log("version need update");
            datasFromFileObject.version = 0;
        }
        else
        {
            Debug.Log("Version already up to date");
        }

        Dictionary<int, versionFormaterCheck> versionToCall = new Dictionary<int, versionFormaterCheck>()
        {
            { 0, ToVersion0},
            { 1, ToVersion1},
            { 2, ToVersion2},
            { 3, ToVersion3},
            { 4, ToVersion4}
        };

        int version = datasFromFileObject.version;
        while (datasFromFileObject.version < actualVersionOfSoft)
        {
            datasFromFileObject = versionToCall[version].DynamicInvoke(datasFromFileObject);
            version++;
        }*/
        datasFromFileObject = JsonConvert.SerializeObject(datasFromFileObject);
        Debug.Log("version update done");
        Debug.Log("new file " + datasFromFileObject);
        return (datasFromFileObject);
    }

    dynamic ToVersion0(dynamic datasFromFileObject)
    {
        Debug.Log("ToVersion0");
        var settings = new Settings(
                new RoadElevation(0.0f)
            );


        var jsonString = JsonConvert.SerializeObject(settings); // in order to add the new object to the data we need to serialize it 
        var tempdatasFromFileObject = JsonConvert.DeserializeObject<dynamic>(jsonString); //desirialize the obejct
        datasFromFileObject.settings = tempdatasFromFileObject; // add the new object to the old one

        var propsToRemove = new List<JProperty>();
        foreach (var prop in datasFromFileObject.Properties())
        {
            if (prop.Name.Equals("versionMajor") || prop.Name.Equals("versionMinor") || prop.Name.Equals("versionPatch")) //this only work if the string referred is used one, here useing "node" for exemple will remove all the ndoe ref, upsi
            {
                propsToRemove.Add(prop);
            }
        }

        propsToRemove.ForEach(x => x.Remove());

        datasFromFileObject.version = datasFromFileObject.version + 1; // up the version of the file
        return (datasFromFileObject);
    }

    dynamic ToVersion1(dynamic datasFromFileObject)
    {
        datasFromFileObject.mapDto.gpsDisplay = datasFromFileObject.mapDto.gpsDisplay != null ? datasFromFileObject.mapDto.gpsDisplay : false;
        datasFromFileObject.mapDto.scoreCriterias.pace.speedFeedbacks = datasFromFileObject.mapDto.scoreCriterias.pace.speedFeedbacks != null ?
            datasFromFileObject.mapDto.scoreCriterias.pace.speedFeedbacks : false;

        datasFromFileObject.version = datasFromFileObject.version + 1; // up the version of the file
        return datasFromFileObject;
    }

    dynamic ToVersion2(dynamic datasFromFileObject)
    {
       /* GpsDisplayDbo gpsDisplay = new GpsDisplayDbo(true, false);

        if (!(datasFromFileObject.mapDto.gpsDisplay is JObject))
        {
            if (datasFromFileObject.mapDto.gpsDisplay is JValue)
            {
                gpsDisplay.activated = datasFromFileObject.mapDto.gpsDisplay;
            }
            var jsonString = JsonConvert.SerializeObject(gpsDisplay); // in order to add the new object to the data we need to serialize it 
            var tempDatasFromFileObject = JsonConvert.DeserializeObject<dynamic>(jsonString); //desirialize the obejct
            datasFromFileObject.mapDto.gpsDisplay = tempDatasFromFileObject; // add the new object to the old one
        }*/
        datasFromFileObject.version = datasFromFileObject.version + 1; // up the version of the file
        return datasFromFileObject;
    }

    dynamic ToVersion3(dynamic datasFromFileObject)
    {
        for (int i = 0; i < datasFromFileObject.mapDto.borders.Count; i++)
        {
            for (int j = 0; j < datasFromFileObject.mapDto.borders[i].nodes.Count; j++)
            {
                string pattern = @"x=(-?\d+)(,)(\d+),y=(-?\d+)(,)(\d+),z=(-?\d+)(,)(\d+)";
                string input = Convert.ToString(datasFromFileObject.mapDto.borders[i].nodes[j].renderProps);
                Match m = Regex.Match(@input, pattern);
                if (m.Success)
                {
                    StringBuilder sb = new StringBuilder(input);
                    sb[m.Groups[2].Index] = '.';
                    sb[m.Groups[5].Index] = '.';
                    sb[m.Groups[8].Index] = '.';
                    datasFromFileObject.mapDto.borders[i].nodes[j].renderProps = sb.ToString();
                }
            }
        }
        datasFromFileObject.version = datasFromFileObject.version + 1; // up the version of the file
        return datasFromFileObject;
    }

    dynamic ToVersion4(dynamic datasFromFileObject)
    {
        string pattern = @"(Speed)(-)(\d+)";
        for (int i = 0; i < datasFromFileObject.mapDto.roads.Count; i++)
        {
            for (int j = 0; j < datasFromFileObject.mapDto.roads[i].lanes.Count; j++)
            {
                for (int k = 0; k < datasFromFileObject.mapDto.roads[i].lanes[j].nodes.Count; k++)
                {
                    for (int l = 0; l < datasFromFileObject.mapDto.roads[i].lanes[j].nodes[k].freePanels.Count; l++)
                    {
                        string input = Convert.ToString(datasFromFileObject.mapDto.roads[i].lanes[j].nodes[k].freePanels[l].panelId);
                        Match m = Regex.Match(@input, pattern);
                        if (m.Success)
                        {
                            datasFromFileObject.mapDto.roads[i].lanes[j].nodes[k].freePanels[l].panelId = "Orange Speed Limit Panel " + m.Groups[3];
                            datasFromFileObject.mapDto.roads[i].lanes[j].nodes[k].freePanels[l].speed = int.Parse(m.Groups[3].Value);
                        }
                    }
                }
            }
        }
        datasFromFileObject.version = datasFromFileObject.version + 1; // up the version of the file
        return datasFromFileObject;
    }
}
