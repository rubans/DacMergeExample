using Microsoft.SqlServer.Dac;
using Microsoft.SqlServer.Dac.Model;
using Public.Dac.Samples;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DacPacMergeExample
{
    internal class MergeDacPacs
    {
        internal static void Merge()
        {
            var samplePackagagePath = @"C:\Dev\ed\DacMergeExample\SampleSQLProj\bin\Debug\Sample.dacpac";
            TSqlModel sampleModel = new TSqlModel(samplePackagagePath, DacSchemaModelStorageType.Memory);

            var targetPackagePath = @"merged.dacpac";

            DisposableList disposables = new DisposableList();

            var newModel = new TSqlModel(sampleModel.Version, sampleModel.CopyModelOptions());
            foreach (var item in sampleModel.GetObjects(DacQueryScopes.UserDefined))
            {
                string script;
                if (item.TryGetScript(out script))
                {
                    newModel.AddObjects(script);
                }
            }

            DacPackageExtensions.BuildPackage(
                    targetPackagePath,
                    newModel,
                    new PackageMetadata(), // Describes the dacpac. 
                    new PackageOptions());  // Use this to specify the deployment contributors, refactor log to include in package

            //DacPackage package = disposables.Add(DacPackage.Load(targetPackagePath, DacSchemaModelStorageType.Memory, FileAccess.ReadWrite));
            //package.UpdateModel(cilModel, new PackageMetadata());
        }

    }
}
