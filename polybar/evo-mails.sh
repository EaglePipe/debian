#!/bin/bash
# Polybar Evolution Statusanzeige (präzise Multi-Konto-Version)
# Zeigt graues @, wenn Evolution läuft, orange @, wenn in irgendeinem Konto ungelesene Mails sind

ICON="@"
COLOR_ACTIVE="#888888"   # Grau – Evolution offen, keine neuen Mails
COLOR_ALERT="#CE6600"    # Orange – Neue Mails

# Prüfen, ob Evolution läuft
if ! pgrep -f "evolution$" >/dev/null; then
  echo ""
  exit 0
fi

# Basispfade für Maildaten
MAIL_PATHS=(
  "$HOME/.cache/evolution/mail/"
  "$HOME/.local/share/evolution/mail/"
)

has_unread=false

for BASE in "${MAIL_PATHS[@]}"; do
  # 1️⃣ Exchange / EWS / IMAP caches mit folder-tree-Dateien prüfen
  while IFS= read -r file; do
    # Nur echte Ordner (kein Trash, Junk)
    if [[ "$file" =~ trash|junk ]]; then
      continue
    fi
    # Nur Treffer, wenn wirklich UnRead > 0
    if grep -q "UnRead=[1-9][0-9]*" "$file" 2>/dev/null; then
      has_unread=true
      break 2
    fi
  done < <(find "$BASE" -type f -name "folder-tree" 2>/dev/null)

  # 2️⃣ Lokale oder IMAP .ev-summary-Datenbanken prüfen
  while IFS= read -r db; do
    # Überspringen, falls Datenbank leer oder defekt
    count=$(sqlite3 "$db" "SELECT COUNT(*) FROM messages WHERE read=0;" 2>/dev/null)
    if [[ "$count" =~ ^[0-9]+$ ]] && [ "$count" -gt 0 ]; then
      has_unread=true
      break 2
    fi
  done < <(find "$BASE" -type f -name "*.ev-summary" 2>/dev/null)
done

# 🔹 Ausgabe
if $has_unread; then
  echo "%{F$COLOR_ALERT}$ICON%{F-}"
else
  echo "%{F$COLOR_ACTIVE}$ICON%{F-}"
fi
