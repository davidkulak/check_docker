# check_docker
Nagios/Shinken plugin to check docker and containers state.

## Usage
    usage: check_docker [-h] [-H SOCKET] [-c CONTAINER]
    
    optional arguments:
       -h                    show this help message and exit
       -H SOCKET             socket location for docker engine
       -c CONTAINER          container NAME or ID


## Sample Output
With Docker engine check
    
    OK - Docker engine running. | containers=1 images=4

With container check
    
    OK - Container 625575c9b3d2 is running. | IP: 172.17.0.2, StartedAt: 2016-10-14T08:50:07.075746752Z
