#!/bin/bash

# Zjištění adresáře, kde se skript nachází
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Cesta k obrázku relativní ke skriptu
WALLPAPER_PATH="$SCRIPT_DIR/boot_wallpaper.png"

# Cílová cesta v /boot/grub/
GRUB_WALLPAPER_PATH="/boot/grub/background.png"

# Zkontroluj, zda soubor existuje
if [ ! -f "$WALLPAPER_PATH" ]; then
  echo "Obrázek $WALLPAPER_PATH nebyl nalezen."
  exit 1
fi

# Záloha stávajícího konfiguračního souboru GRUB, pokud již nebyla vytvořena
if [ ! -f /etc/default/grub.bak ]; then
  sudo cp /etc/default/grub /etc/default/grub.bak
  echo "Záloha konfiguračního souboru GRUB byla vytvořena."
else
  echo "Záloha konfiguračního souboru GRUB již existuje."
fi

# Zkopírování obrázku do složky /boot/grub/
if sudo cp "$WALLPAPER_PATH" "$GRUB_WALLPAPER_PATH"; then
  echo "Obrázek byl úspěšně zkopírován."
else
  echo "Kopírování obrázku selhalo."
  exit 1
fi

# Nastavení obrázku jako pozadí GRUB v konfiguračním souboru
if sudo sed -i "/GRUB_BACKGROUND=/c\GRUB_BACKGROUND=\"$GRUB_WALLPAPER_PATH\"" /etc/default/grub; then
  echo "Konfigurace GRUB byla úspěšně aktualizována."
else
  echo "Aktualizace konfigurace GRUB selhala."
  exit 1
fi

# Aktualizace konfigurace GRUB
if sudo grub-mkconfig -o /boot/grub/grub.cfg; then
  echo "Konfigurace GRUB byla úspěšně aktualizována."
else
  echo "Aktualizace konfigurace GRUB selhala."
  exit 1
fi

echo "Obrázek byl úspěšně nastaven jako pozadí GRUB."
