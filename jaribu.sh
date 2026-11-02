#!/bin/bash
# jaribu.sh -- kusanya na kuendesha kila mtihani/jaribio_*.swa.
# SWA=<njia ya swa> (chaguo-msingi: swa kwenye PATH). Swa hupata maktaba
# yake kando yake; husisha { msingi/mizani.swa } hutatuliwa kutoka hapa.
set -u
cd "$(dirname "$0")" || exit 1
SWA="${SWA:-swa}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
PASS=0; FAIL=0
for f in mtihani/jaribio_*.swa; do
    jina="$(basename "$f" .swa)"
    if ! "$SWA" --exe "$f" > "$TMP/$jina" 2> "$TMP/$jina.err"; then
        echo "SHINDWA: kukusanya $f"; cat "$TMP/$jina.err"; FAIL=$((FAIL+1)); continue
    fi
    chmod +x "$TMP/$jina"
    if timeout 120 "$TMP/$jina"; then PASS=$((PASS+1)); else echo "SHINDWA: $f (kutoka $?)"; FAIL=$((FAIL+1)); fi
done
echo "===== Matokeo ya mizani: $PASS yamefaulu, $FAIL yameshindwa ====="
[ "$FAIL" -eq 0 ]
