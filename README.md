# DevOps Monitoring System

A lightweight bash-based monitoring system built as part of my DevOps learning journey.

## What it does
- Monitors disk usage and triggers alerts
- Scans application logs for errors and warnings
- Sends real-time Slack notifications when error threshold is exceeded
- Suppresses duplicate alerts to prevent alert fatigue
- Auto-generates dated reports and cleans up files older than 7 days
- Fully automated via cron jobs
- CPU monitoring added

## Scripts
- `monitor.sh` — disk usage monitor with OK/WARNING/CRITICAL thresholds
- `log_scanner.sh` — log scanner with automated dated reporting
- `alert.sh` — error counter with Slack webhook integration and deduplication

## Setup
```bash
git clone https://github.com/Sangeeta-Ganiger/devops-monitoring.git
cd devops-monitoring
export SLACK_WEBHOOK="your-webhook-url"
chmod 755 *.sh
```

## Skills demonstrated
Linux bash scripting, cron automation, log analysis, Slack API integration, environment variables, file management
