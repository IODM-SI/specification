#!/bin/sh
set -eu

repo_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
output_dir=${1:-"$repo_dir/pdf"}
mkdir -p -- "$output_dir"
staging_dir=$(mktemp -d -- "$output_dir/.iodm-build.XXXXXX")
trap 'rm -f -- "$staging_dir/"*.pdf; rmdir -- "$staging_dir"' EXIT
trap 'exit 1' HUP INT TERM

for source in "$repo_dir/source/"*.typ; do
  [ "${source##*/}" = template.typ ] && continue

  filename=$(typst eval --root "$repo_dir" --format yaml \
    --input "filename=${source##*/}" '{
      import ("/source/" + sys.inputs.filename): publication
      let safe = regex("^[A-Za-z0-9][A-Za-z0-9._-]*$")
      assert(publication.id.match(safe) != none, message: "Invalid publication ID")
      assert(publication.version.match(safe) != none, message: "Invalid publication version")
      publication.id + "-v" + publication.version + ".pdf"
    }') || {
      printf 'Could not read publication metadata in %s\n' "$source" >&2
      exit 1
    }

  if [ -e "$staging_dir/$filename" ]; then
    printf 'Duplicate publication filename: %s\n' "$filename" >&2
    exit 1
  fi

done

for pdf in "$staging_dir/"*.pdf; do
  if [ ! -f "$pdf" ]; then
    printf '%s\n' 'No publication PDFs were generated.' >&2
    exit 1
  fi
  mv -f -- "$pdf" "$output_dir/"
done
