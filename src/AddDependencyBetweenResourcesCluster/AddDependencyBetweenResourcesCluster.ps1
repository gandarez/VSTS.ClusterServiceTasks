Param(
	[string]$clusterName,
	[string]$resourceName,
	[string]$resourceDependent,
	[string]$waitTimeoutInSeconds
)

# Import the Task.Common dll that has all the cmdlets we need for Build
import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"

Write-Host "Adding dependency between $resourceName and $resourceDependent on $clusterName"
$resource = Get-WmiObject -Computer "$clusterName" -namespace 'root\mscluster' `MSCluster_Resource | Where {$_.Name -eq "$resourceName"}
$resource.AddDependency($resourceDependent)