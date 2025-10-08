#!/bin/bash
# Polybar Evolution Statusanzeige (saubere Version mit verwaisten Fix)
# Grau = keine ungelesenen Mails, Orange = neue ungelesene Mails

ICON="@"
COLOR_ACTIVE="#888888"
COLOR_ALERT="#CE6600"

# Prüfen, ob Evolution läuft
pgrep -f "evolution$" >/dev/null || { echo ""; exit 0; }

total_unread=0
valid_unread=0

# --- Durchsuche alle Konten ---
for f in "$HOME/.cache/evolution/mail/"*/folder-tree; do
  [ -f "$f" ] || continue

  # Zähle nur Posteingänge, ignoriere veraltete Caches
  count=$(awk '
    BEGIN {IGNORECASE=1; folder=""; unread=0; valid=0}
    /^\[Folder/ {folder=$0}
    /UnRead=/ {
      split($0,a,"=")
      val=a[2]+0
      if (folder ~ /Inbox|Posteingang/ && val>0) {
        unread+=val
        valid=1
      }
    }
    END {
      if (valid) print unread
      else print 0
    }
  ' "$f")

  [[ "$count" =~ ^[0-9]+$ ]] || count=0
  total_unread=$((total_unread + count))
  if [ "$count" -gt 0 ]; then valid_unread=1; fi
done

# --- Datenbanken (iCloud, GMX usw.) ---
for db in "$HOME/.cache/evolution/mail/"*/folders.db; do
  [ -f "$db" ] || continue
  count=$(sqlite3 "$db" "SELECT SUM(unread_count) FROM folders WHERE folder_name LIKE 'INBOX%' OR folder_name LIKE 'Posteingang%';" 2>/dev/null)
  [[ "$count" =~ ^[0-9]+$ ]] || count=0
  total_unread=$((total_unread + count))
  if [ "$count" -gt 0 ]; then valid_unread=1; fi
done

# --- Ausgabe ---
if [ "$valid_unread" -eq 1 ] && [ "$total_unread" -gt 0 ]; then
  echo "%{F$COLOR_ALERT}$ICON $total_unread%{F-}"
else
  echo "%{F$COLOR_ACTIVE}$ICON%{F-}"
fi
