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

/app/ll-tests/gamesvr-goldsource.cstrike.sh
/app/ll-tests/gamesvr-goldsource.czero.sh
/app/ll-tests/gamesvr-goldsource.dmc.sh
/app/ll-tests/gamesvr-goldsource.dod.sh
/app/ll-tests/gamesvr-goldsource.gearbox.sh
/app/ll-tests/gamesvr-goldsource.hldm.sh
/app/ll-tests/gamesvr-goldsource.ricochet.sh
/app/ll-tests/gamesvr-goldsource.tfc.sh
