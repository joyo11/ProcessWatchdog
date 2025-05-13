# ProcessWatchdog

**Monitor Critical Linux Processes. Auto-Heal When They Fail.**

`ProcessWatchdog` is a lightweight, script-based tool designed to run on Unix-like systems (Linux/macOS) to continuously monitor system processes and restart them automatically if they crash. It is ideal for ensuring uptime of critical services like `nginx`, `redis`, `mysql`, or even your own custom daemons.

---

## Why This Project?

This project showcases practical and deep working knowledge of **Linux environments**, covering:

- Process monitoring (`pgrep`, `ps`)
- Service control (`systemctl`, fallback-safe on macOS)
- Shell scripting (Bash)
- Cron jobs
- Logging
- File permissions
- System observability and reliability practices

---

## Tech Stack

| Layer             | Tool / Tech Used             |
|------------------|------------------------------|
| Scripting        | Bash                         |
| Scheduler        | Cron                         |
| Process Manager  | `pgrep`, `systemctl`, `grep` |
| OS Compatibility | Linux, macOS                 |
| CI (optional)    | GitHub Actions (ShellCheck)  |

---

## ✨ Features

### Current Features
- **Monitor Any Process**: Supply the process name and it checks if it’s running.
- **Auto-Restart (Linux)**: Uses `systemctl` to restart services if they fail.
- **Mac-Compatible**: Gracefully skips restart on macOS (or extend via `brew services`).
- **Logging**: Appends human-readable logs with timestamps to `logs/watchdog.log`.
- **Cron-Ready**: Install a scheduled check in one command.
- **Docker-Friendly**: Works great in minimal containers for lightweight service guards.

### In Development
- Email alerts (using `mail` or `sendmail`)
- Web UI to display live status of monitored services
- Restart via `launchctl` or `brew services` on macOS
- Support for multiple processes (via config file)
- Log rotation
- System resource monitoring (CPU/memory thresholds)

---

## How It Works

1. Takes a process name as input (`nginx`, `zsh`, etc.)
2. Uses `pgrep` to check if it's running.
3. If not:
   - On Linux: attempts to restart using `systemctl`
   - On macOS: logs the issue (no restart attempted)
4. Writes results with timestamps into `logs/watchdog.log`
5. Can be run manually or scheduled via cron every minute

---

## Quick Start

### Prerequisites
- Linux or macOS
- `cron` installed and running
- For restarts on Linux: `sudo` and `systemctl`

### 🔧 Setup


```bash
git clone https://github.com/yourusername/ProcessWatchdog.git
cd ProcessWatchdog
chmod +x *.sh
./setup.sh  # Installs a cron job for monitoring nginx every minute

./watchdog.sh nginx #On Linux

./watchdog.sh zsh #On macOS

```
### Future Goals

I plan to expand **ProcessWatchdog** with the following features:

- Build a **web-based status dashboard** using Flask and WebSocket so I can visually track the health of monitored processes in real time.
- Integrate with **Prometheus and Grafana** to expose metrics and build rich dashboards for long-term observability.
- Add **alerting support via Slack, Email, or Discord** to get notified the moment a critical process goes down.
- **Containerize the tool with Docker** to make it easier to deploy in ephemeral or cloud environments.
- Introduce support for **service groups or dependencies**, so I can monitor and manage complex service chains more effectively.


## License
Copyright (c) 2025 Mohammad Shafay Joyo

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For questions or support:

Email: shafay11august@gmail.com
GitHub: @joyo11
