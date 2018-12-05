//-----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//-----------------------------------------------------------------------------

using System;
using System.Net.Http;
using Microsoft.WindowsAzure.ResourceStack.Common.Algorithms;
using Microsoft.WindowsAzure.ResourceStack.Common.Json;
using Microsoft.WindowsAzure.ResourceStack.Frontdoor.Templates.Schema;

namespace CalculateTemplateHash
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var response = (new HttpClient()).GetAsync(args[0]).Result;

                // Convert to JSON Object and back so that formatting is exactly the same as the implementation used by telemetry
                var templatejson = response.Content.ReadAsStringAsync().Result.FromJson<Template>().ToJson();

                Console.WriteLine(ComputeHash.MurmurHash64(templatejson).ToString());
            }
            catch (Exception e)
            {
                Console.Error.WriteLine(e.Message);
            }
        }
    }
}
