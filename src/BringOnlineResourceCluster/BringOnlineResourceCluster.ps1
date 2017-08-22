Param(
	[string]$clusterName,
	[string]$resourceName,
	[string]$waitTimeoutInSeconds
)

# Import the Task.Common dll that has all the cmdlets we need for Build
import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"

Write-Host "Starting $resourceName on $clusterName"
$resource = Get-WmiObject -Computer "$clusterName" -namespace 'root\mscluster' `MSCluster_Resource | Where {$_.Name -eq "$resourceName"}

if(!$resource)
{
    Write-Host "Resource $resourceName not found on $clusterName"
    return 1    
}

$resource.BringOnline($waitTimeoutInSeconds)