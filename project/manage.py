#!/usr/bin/env python
import os
import sys
import environ

if __name__ == "__main__":
    
    root = environ.Path(__file__) - 2  # (/depp-tracking/)
    env = environ.Env(
        DEBUG=(bool, True),
    )
    env.read_env(root('config/.env'))
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", env('DJANGO_SETTINGS_MODULE'))
    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
