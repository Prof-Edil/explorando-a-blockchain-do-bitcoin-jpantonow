# How many new outputs were created by block 123,456?

hash = $(bitcoin-cli getblockhash 123456)
data = $(bitcoin-cli getblock $hash 2)
counter = $(jq '[.tx[].vout | length] | add')
outputs_count = $(bitcoin-cli $data | $counter)
