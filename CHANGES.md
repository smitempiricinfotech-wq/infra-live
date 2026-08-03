## 2026-06-22 - INC-2231 db-sg break-glass

During a fresh incident (incident window 22:00-23:30 UTC on 2026-06-22), on-call used the break-glass-admin role to open db-sg to the bastion subnet 10.0.9.0/24 so they could run an emergency fix. This was authorised break-glass, keep the bastion rule.

## 2026-06-21 - assets bucket

Nobody on the team recognises this change; it was not on any ticket, flagging for review.

## 2026-06-20 - api autoscaling

Ops note that api-asg desired_capacity floats during the day, the autoscaler owns it, do not pin it in code.

## 2026-06-19 - data volume capacity

oncall-eng grew the data volume because it hit 95% full during the nightly batch; note it went from 100 GB to 500 GB and to keep it.

## 2026-06-18 - web-sg

AWS Config auto-remediation closed the open 443 rule down to the office CIDR 203.0.113.0/24, per the "no 0.0.0.0/0 on 443" guardrail.

## 2026-06-17 - prod-alerts SNS topic

platform-eng created the prod-alerts SNS topic in the console while standing up the new alerting pipeline. It is intentional and should be brought under Terraform, it is not in the state yet.

## 2026-06-14 - INC-2214 orders-db

During the payments outage (incident window 02:00-04:00 UTC), oncall scaled orders-db from db.r5.large to db.r5.2xlarge to clear the connection backlog; keep it at 2xlarge, scaling back down re-triggers the outage.
