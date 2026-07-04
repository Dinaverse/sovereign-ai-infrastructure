# WSL2 Context Deadline Exceeded

## Problem
Connection timeouts and "context deadline exceeded" errors when performing Docker operations in WSL2 on the Dell Precision orchestrator.

## Solution
1. **Allocate Resources**: Created/updated `~/.wslconfig` to increase RAM and CPU limits for the WSL2 instance.
2. **Docker Storage**: Configured Docker to use a local path for storage within WSL2 to minimize latency caused by the 9p filesystem mounting of the Windows host.
