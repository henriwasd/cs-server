#!/bin/bash

CONTAINER_NAME="cs2"
STEAMCMD_PATH="/home/steam/steamcmd/steamcmd.sh"
CS2_DIR="/home/steam/cs2-dedicated"
STEAM_USER="anonymous"
GAMEINFO_PATH="~/cs2/game/csgo/gameinfo.gi"

docker exec -it $CONTAINER_NAME $STEAMCMD_PATH +force_install_dir $CS2_DIR +login $STEAM_USER +app_update 730 validate +exit

if [ $? -eq 0 ]; then
  echo "Servidor CS2 atualizado com sucesso!"

  sed -i 's/Game_LowViolence\tcsgo_lv \/\/ Perfect World content override/Game_LowViolence\tcsgo_lv \/\/ Perfect World content override\n\t\tGame\tcsgo\/addons\/metamod/g' "$GAMEINFO_PATH"

  if [ $? -eq 0 ]; then
    echo "gameinfo.gi modificado com sucesso!"
  else
    echo "Erro ao modificar gameinfo.gi."
    exit 1
  fi

else
  echo "Erro ao atualizar o servidor CS2."
  exit 1
fi

docker restart $CONTAINER_NAME
echo "Contêiner Docker reiniciado."
