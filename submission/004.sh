# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
XPUB="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"
INDEX=100
DESCRIPTOR="tr(${XPUB}/0/*)"
bitcoin-cli importdescriptors "[{\"desc\":\"${DESCRIPTOR}\",\"active\":true,\"internal\":false,\"timestamp\":\"now\"}]"
DERIVED_DESC=$(bitcoin-cli deriveaddresses "tr(${XPUB}/0/${INDEX})")
echo "$DERIVED_DESC"