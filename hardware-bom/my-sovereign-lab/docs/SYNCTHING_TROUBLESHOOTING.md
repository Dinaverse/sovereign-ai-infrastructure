# 🔄 Syncthing Troubleshooting: Remote Access & Tunneling

This document outlines the methodology for diagnosing and resolving connectivity issues with remote Syncthing web interfaces, utilizing SSH tunneling for secure access.

## 1. Problem Identification
If you encounter an "ERR_CONNECTION_REFUSED" error when accessing a remote Syncthing web interface (usually `http://127.0.0.1:port`), it is typically due to one of two causes:
- **Service Inactive:** The `syncthing` service is not running on the remote node.
- **Tunnel Closed:** The SSH port forwarding tunnel is not established or has been terminated.

## 2. Resolution Procedure

### A. Verify Remote Service
1. Connect to the remote machine via SSH:
   ```bash
   ssh -i ~/.ssh/id_lab_master <user>@<node_hostname>
   ```
2. Verify the status of the service:
   ```bash
   systemctl --user status syncthing
   ```
3. If the service is inactive, restart it:
   ```bash
   systemctl --user restart syncthing
   ```

### B. Establish SSH Tunnel (Port Forwarding)
To securely access the remote web interface on your local machine, create a tunnel that redirects the remote port to a local port.

Run the following command in a dedicated, open terminal:
```bash
ssh -L <port_local>:127.0.0.1:<port_distant> -i ~/.ssh/id_lab_master <user>@<node_hostname> -N
```

**Example (mapping remote 8384 to local 8385):**
```bash
ssh -L 8385:127.0.0.1:8384 -i ~/.ssh/id_lab_master <user>@<node_hostname> -N
```

### C. Access
Once the tunnel is established, access the interface via:
```
http://127.0.0.1:<port_local>
```

## 3. Security Reminders
- **Encryption:** The SSH tunnel ensures that traffic between your machine and the remote node is fully encrypted.
- **Exposure:** Never expose the Syncthing port (8384) directly to the public internet.
- **Best Practice:** Always use the local interface via an encrypted tunnel for configuring your synchronization settings.

---
*Technical Troubleshooting Reference — June 14, 2026*
