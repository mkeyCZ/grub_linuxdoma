#!/bin/bash

# Cesta k obrázku v domovském adresáři
WALLPAPER_PATH="$HOME/boot_wallpaper/boot_wallpaper.png"

# Cílová cesta v /boot/grub/
GRUB_WALLPAPER_PATH="/boot/grub/background.png"

# Zkontroluj, zda soubor existuje
if [ ! -f "$WALLPAPER_PATH" ]; then
  echo "Obrázek $WALLPAPER_PATH nebyl nalezen."
  exit 1
fi

# Záloha stávajícího konfiguračního souboru GRUB
sudo cp /etc/default/grub /etc/default/grub.bak

# Zkopírování obrázku do složky /boot/grub/
sudo cp "$WALLPAPER_PATH" "$GRUB_WALLPAPER_PATH"

# Nastavení obrázku jako pozadí GRUB v konfiguračním souboru
sudo sed -i "/GRUB_BACKGROUND=/c\GRUB_BACKGROUND=\"$GRUB_WALLPAPER_PATH\"" /etc/default/grub

# Aktualizace konfigurace GRUB
sudo update-grub

echo "Obrázek byl úspěšně nastaven jako pozadí GRUB."
