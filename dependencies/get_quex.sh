#!/bin/bash

source get_common.sh

QUEX='quex-0.34.1.tar.gz'

echo "Downloading quex from soureforge via http..."
$WGET "http://downloads.sourceforge.net/quex/${QUEX}?modtime=1228587839&big_mirror=0"
echo "Unpacking quex..."
$TAR -xzf "$QUEX" && $RM "$QUEX"
