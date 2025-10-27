#!/bin/bash

# ipexdbl
#curl ...

(
echo '#!/usr/sbin/nft -f'
echo
echo "flush set inet protect ipex_v4"
echo "add element inet protect ipex_v4 {"
grep -E "^[0-9].*" ipexdbl.txt | sed -e 's/$/,/; /:/d'
echo "}"
) > /tmp/update-ipex_v4.nft

(
echo '#!/usr/sbin/nft -f'
echo
echo "flush set inet protect ipex_v6"
echo "add element inet protect ipex_v6 {"
grep -E "^[0-9].*"  ipexdbl.txt| sed -e 's/$/,/; /\./d'
echo "}"
) > /tmp/update-ipex_v6.nft

nft -o -f /tmp/update-ipex_v4.nft
nft -o -f /tmp/update-ipex_v6.nft

