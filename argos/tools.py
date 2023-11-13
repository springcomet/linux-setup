#!/usr/bin/env python3

import re
from gi.repository import Gio

print("🛠️\n---")

file2=open("/home/aviv/aqua/argos/tools.txt",'r')
line=file2.readline()
while(line!=""):
  print(line, end="")
  line=file2.readline()
file2.close()

print ("\nAll\n")

applications = {}

for app_info in Gio.AppInfo.get_all():
  icon, categories = app_info.get_icon(), app_info.get_categories()
  if icon is None or categories is None:
    continue
  # Remove "%U" and "%F" placeholders
  command_line = re.sub("%\\w", "", app_info.get_commandline()).strip()
  app = (app_info.get_name(), icon.to_string(), command_line)
  for category in categories.split(";"):
    if category not in ["GNOME", "GTK", ""]:
      if category not in applications:
        applications[category] = []
      applications[category].append(app)
      break


for category, apps in sorted(applications.items()):
  print("--", category, sep="")
  for app in sorted(apps):
    print("----%s | useMarkup=false iconName=%s bash='%s' terminal=false" % app)