ADDRESS=$(curl -s "https://blockchain.info/block-height/123321?format=json" | \
    jq -r '.blocks[0].tx[].out[] | select(.spent == false) | .addr' | \
    head -n 1)

echo $ADDRESS
