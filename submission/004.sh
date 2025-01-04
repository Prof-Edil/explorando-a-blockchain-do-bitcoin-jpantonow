# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
WALLET_NAME="mywallet"
XPUB="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"
INDEX=100

bitcoin-cli -named createwallet wallet_name="$WALLET_NAME" descriptors=true

bitcoin-cli -rpcwallet="$WALLET_NAME" importdescriptors "[{\"desc\":\"tr($XPUB/$INDEX)\",\"timestamp\":\"now\",\"active\":true,\"range\":[$INDEX,$INDEX]}]"

bitcoin-cli -rpcwallet="$WALLET_NAME" deriveaddresses "tr($XPUB/$INDEX)"