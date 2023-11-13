ZONES="Australia/Sydney Europe/Amsterdam America/New_York America/Los_Angeles"
date -u +'%H:%M:%S UTC'
echo '---'
for zone in $ZONES; do
  echo "$(TZ=$zone date +'%H:%M:%S %z') $zone"
done
