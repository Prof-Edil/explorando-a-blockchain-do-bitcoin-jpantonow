TRANSACTION_LIST=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 257343)| jq -r .tx[])
COINBASE_TRANSACTION_ID=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 256128) | jq -r .tx[0])
COINBASE_OUTPUT_INDEX=0

for TRANSACTION_ID in $TRANSACTION_LIST
do
    readarray -t TRANSACTION_INPUTS < <(bitcoin-cli getrawtransaction $TRANSACTION_ID 1 | jq -c .vin[])
    
    for INPUT_DATA in "${TRANSACTION_INPUTS[@]}"
    do
        PREVIOUS_TRANSACTION_ID=$(echo "$INPUT_DATA" | jq -r .txid)
        PREVIOUS_OUTPUT_INDEX=$(echo "$INPUT_DATA" | jq -r .vout)
        
        if [[ $COINBASE_TRANSACTION_ID == $PREVIOUS_TRANSACTION_ID && $COINBASE_OUTPUT_INDEX == $PREVIOUS_OUTPUT_INDEX ]]
        then
            echo $TRANSACTION_ID
            exit 0
        fi
    done
done
