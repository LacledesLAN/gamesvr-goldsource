#!/bin/bash -i

echo -ne "\n";
echo -ne "  ─────────────────────────────▄██▄ \n"; sleep 0.018;
echo -ne "  ─────────────────────────────▀███ \n"; sleep 0.018;
echo -ne "  ────────────────────────────────█ \n"; sleep 0.018;
echo -ne "  ───────────────▄▄▄▄▄────────────█ \n"; sleep 0.018;
echo -ne "  ──────────────▀▄────▀▄──────────█ \n"; sleep 0.018;
echo -ne "  ──────────▄▀▀▀▄─█▄▄▄▄█▄▄─▄▀▀▀▄──█ \n"; sleep 0.018;
echo -ne "  ─────────█──▄──█────────█───▄─█─█ \n"; sleep 0.018;
echo -ne "  ─────────▀▄───▄▀────────▀▄───▄▀─█ \n"; sleep 0.018;
echo -ne "  ──────────█▀▀▀────────────▀▀▀─█─█ \n"; sleep 0.018;
echo -ne "  ──────────█───────────────────█─█ \n"; sleep 0.018;
echo -ne "  ▄▀▄▄▀▄────█──▄█▀█▀█▀█▀█▀█▄────█─█ \n"; sleep 0.018;
echo -ne "  █▒▒▒▒█────█──█████████████▄───█─█ \n"; sleep 0.018;
echo -ne "  █▒▒▒▒█────█──██████████████▄──█─█ \n"; sleep 0.018;
echo -ne "  █▒▒▒▒█────█───██████████████▄─█─█ \n"; sleep 0.018;
echo -ne "  █▒▒▒▒█────█────██████████████─█─█ \n"; sleep 0.018;
echo -ne "  █▒▒▒▒█────█───██████████████▀─█─█ \n"; sleep 0.018;
echo -ne "  █▒▒▒▒█───██───██████████████──█─█ \n"; sleep 0.018;
echo -ne "  ▀████▀──██▀█──█████████████▀──█▄█ \n"; sleep 0.018;
echo -ne "  ──██───██──▀█──█▄█▄█▄█▄█▄█▀──▄█▀  \n"; sleep 0.018;
echo -ne "  ──██──██────▀█─────────────▄▀▓█   \n"; sleep 0.018;
echo -ne "  ──██─██──────▀█▀▄▄▄▄▄▄▄▄▄▀▀▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──████────────█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──███─────────█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──██──────────█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──██──────────█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──██─────────▐█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──██────────▐█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█   \n"; sleep 0.018;
echo -ne "  ──██───────▐█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▌   \n"; sleep 0.018;
echo -ne "  ──██──────▐█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▌    \n"; sleep 0.018;
echo -ne "  ──██─────▐█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▌     \n"; sleep 0.018;
echo -ne "  ──██────▐█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▌      \n"; sleep 0.018;
echo -ne "\n";
echo -ne "This is just a convenience script - do not use for CI pipelines!\n";
echo -ne "\n";

echo 10 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.cstrike.sh

echo 80 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.czero.sh

echo 40 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.dmc.sh

echo 30 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.dod.sh

echo 50 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.gearbox.sh

echo 90 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.hldm.sh

echo 60 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.ricochet.sh

echo 20 > /app/steam_appid.txt;
sleep 1;
/app/ll-tests/gamesvr-goldsource.tfc.sh
