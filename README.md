# Overview

MC (Master of Ceremonies) is a simple web hook handler that waits for webhooks and then runs an event
(Ansible script). The main value is a simple Ansible playbook runner that can
be triggered from a build passing, making for easy deploys.

# Getting Started

MC is built using Sinatra and has minimal dependencies. You can define a
webhook to listen in `events.yml` like:

```
example_app_deploy_event:
  endpoint: /example_app/deploy
  event: Deploy Example
  responsiblities:
    - task_name: Deploy
      repo: git://agundy/example.git
      playbook: ./deploys/deploy.yml
  closing:
    - publish: "Deployed!"
      url: https://deploy.agundy.com

```

# What is an event?

After a build finishes automated deploys, more tests or more builds can be
triggered. Events organize it all, run scripts, log results, and can even
trigger more webhooks.
