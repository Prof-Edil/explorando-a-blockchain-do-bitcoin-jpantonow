# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`

XPUB="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"
INDEX=100

DESCRIPTOR="tr(${XPUB}/0/0)"

DESCRIPTOR_INFO=$(bitcoin-cli getdescriptorinfo "$DESCRIPTOR")

CHECKSUM_DESC=$(echo "$DESCRIPTOR_INFO" | jq -r '.descriptor')

DERIVED_DESCRIPTOR="${CHECKSUM_DESC//\*/$INDEX}"

ADDRESS=$(bitcoin-cli deriveaddresses "$DERIVED_DESCRIPTOR" | jq -r '.[0]')
echo "$ADDRESS"
