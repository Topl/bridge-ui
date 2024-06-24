#!/bin/bash

apt update
apt install -y curl gzip
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod +x cs
./cs setup --yes
shopt -s expand_aliases
alias brambl-cli="./cs launch -r https://s01.oss.sonatype.org/content/repositories/releases co.topl:brambl-cli_2.13:2.0.0-beta2 -- "
export BTC_USER=bitcoin
export BTC_PASSWORD=password
export WALLET_PASSWORD=password
export apparatus_wallet_DB=/wallet/topl-wallet.db
export apparatus_wallet_JSON=/wallet/topl-wallet.json
export apparatus_wallet_MNEMONIC=/wallet/topl-mnemonic.txt
rm -rf $apparatus_wallet_DB $apparatus_wallet_JSON $apparatus_wallet_MNEMONIC
rm genesisTx.pbuf genesisTxProved.pbuf groupMintingtx.pbuf groupMintingtxProved.pbuf seriesMintingTx.pbuf seriesMintingTxProved.pbuf
brambl-cli wallet init --network private --password $WALLET_PASSWORD --newwalletdb $apparatus_wallet_DB --mnemonicfile $apparatus_wallet_MNEMONIC --output $apparatus_wallet_JSON
export ADDRESS=$(brambl-cli wallet current-address --walletdb $apparatus_wallet_DB)
brambl-cli simple-transaction create --from-fellowship nofellowship --from-template genesis --from-interaction 1 --change-fellowship nofellowship --change-template genesis --change-interaction 1  -t $ADDRESS -w $WALLET_PASSWORD -o genesisTx.pbuf -n private -a 1000 -h bifrost --port 9084 --keyfile $apparatus_wallet_JSON --walletdb $apparatus_wallet_DB --fee 10 --transfer-token lvl
brambl-cli tx prove -i genesisTx.pbuf --walletdb $apparatus_wallet_DB --keyfile $apparatus_wallet_JSON -w $WALLET_PASSWORD -o genesisTxProved.pbuf
export GROUP_UTXO=$(brambl-cli tx broadcast -i genesisTxProved.pbuf -h bifrost --port 9084)
