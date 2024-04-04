#!/bin/bash
source .venv/bin/activate && OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES ANSIBLE_FORCE_COLOR=1 PYTHONUNBUFFERED=1 .venv/bin/ansible-playbook "$@"
