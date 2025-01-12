for TRANSACTION_ID in $(bitcoin-cli getblock $(bitcoin-cli getblockhash 257343) | jq -r .tx[])
do
    readarray -t TX_INPUTS < <(bitcoin-cli getrawtransaction $TRANSACTION_ID 1 | jq -c .vin[])
    
    for TX_INPUT in "${TX_INPUTS[@]}"
    do
        PREV_TXID=$(echo "$TX_INPUT" | jq -r .txid)
        PREV_VOUT=$(echo "$TX_INPUT" | jq -r .vout)
        if [[ $(bitcoin-cli getblock $(bitcoin-cli getblockhash 256128) | jq -r .tx[0]) == $PREV_TXID && $(0) == $PREV_VOUT ]]
        then
            echo $TRANSACTION_ID
            exit 0
        fi
    done
done