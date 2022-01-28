# CSGO Map CVAR Scanning/Scraping Tools

Bash scripts I developed to be able to identify CVARS used in maps and add support for these maps to a CSGO DS

## How to use

1. Run `create_cvar_dict.sh` to create a dictionary of all CVARS (used in later scripts)
2. Get a csgo map decomplier like https://github.com/ata4/bspsrc and decompile the map
3. Against the extracted map run `scan_map_cvars.sh` /path/to/map/src/
4. Against test csgo servers `bspconvar_whitelist.txt` run `check_whitelist_cvars.sh`
5. Append the printed CVARS to the csgo servers `bspconvar_whitelist.txt` to fully support the map
