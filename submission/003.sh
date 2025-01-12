# How many new outputs were created by block 123,456?

hash=$(bitcoin-cli getblockhash 123456)
data=$(bitcoin-cli getblock "$hash" 2)
counter=$(echo "$data" | jq '[.tx[].vout | length] | add')
echo "$counter"
