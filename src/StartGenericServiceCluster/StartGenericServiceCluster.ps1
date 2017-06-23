Param(
	[string]$clusterName,
	[string]$resourceName,
	[string]$waitTimeoutInSeconds
)

# Import the Task.Common dll that has all the cmdlets we need for Build
import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"

Write-Host "Starting $resourceName on $clusterName"
$service = Get-WmiObject -Computer "$clusterName" -namespace 'root\mscluster' `MSCluster_Resource | Where {$_.Name -eq "$resourceName"}
$service.BringOnline($waitTimeoutInSeconds)