#!/bin/sh
set -eu

repo_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
output_dir=${1:-"$repo_dir/pdf"}
mkdir -p "$output_dir"

typst compile "$repo_dir/source/standard.typ" "$output_dir/IODM-001-v0.3.pdf"
typst compile "$repo_dir/source/card.typ" "$output_dir/IODM-002-v0.3.pdf"
typst compile "$repo_dir/source/reader.typ" "$output_dir/IODM-003-v0.3.pdf"
typst compile "$repo_dir/source/issuer.typ" "$output_dir/IODM-004-v0.3.pdf"
typst compile "$repo_dir/source/trust.typ" "$output_dir/IODM-005-v0.3.pdf"
typst compile "$repo_dir/source/identity.typ" "$output_dir/IODM-006-v0.3.pdf"
typst compile "$repo_dir/source/manifest.typ" "$output_dir/IODM-007-v0.3.pdf"
typst compile "$repo_dir/source/whitepaper.typ" "$output_dir/IODM-WP-001-v0.3.pdf"
