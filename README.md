# Nastavení Pozadí GRUB s logem projektu: [linuxdoma.cz](https://forum.linuxdoma.cz/)

## Přehled

Tento skript je navržen tak, aby zjednodušil proces přizpůsobení GRUB bootloaderu nastavením vlastního obrázku jako pozadí. Automaticky konfiguruje specifikovaný obrázek jako pozadí pro GRUB, což zajišťuje personalizovaný a vizuálně atraktivní zážitek při startu systému.

## Funkce

- **Automatizované Nastavení**: Skript zajišťuje všechny nezbytné kroky pro nastavení vlastního pozadí GRUB, včetně kopírování souborů a aktualizace konfigurace.
- **Funkce Zálohování**: Před provedením jakýchkoliv změn skript vytvoří zálohu původního konfiguračního souboru GRUB, což umožňuje snadné obnovení předchozího nastavení v případě potřeby.
- **Jednoduché Použití**: Jediným příkazem skript nastaví pozadí, aktualizuje GRUB a poskytne zpětnou vazbu po úspěšném dokončení.

## Požadavky

- Linuxová distribuce s nainstalovaným GRUB.
- Sudo práva pro umožnění modifikace systémových souborů.

## Použití

1. **Příprava Obrázku**: Ujistěte se, že váš obrázek je ve formátu PNG, JPG nebo TGA a má rozlišení podporované vaší obrazovkou (např. 1024x768).

2. **Umístění Obrázku**: Uložte nebo přesuňte obrázek do adresáře `boot_wallpaper` ve vašem domovském adresáři a pojmenujte jej `boot_wallpaper.png`.

3. **Spuštění Skriptu**:
   - Stáhněte nebo klonujte tento repozitář.
   - Udělte skriptu spustitelná práva příkazem:
     ```bash
     chmod +x grub_skript.sh
     ```
   - Spusťte skript příkazem:
     ```bash
     ./grub_skript.sh
     ```

Skript automaticky nastaví váš obrázek jako pozadí GRUB a provede potřebné úpravy konfigurace.
