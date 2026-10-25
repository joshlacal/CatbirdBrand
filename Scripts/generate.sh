#!/usr/bin/env bash
# Regenerates Swift token types AND the bundled tokens.json resource
# from docs/brand/tokens/*.pkl.
#
# - Swift types: emitted by `pkl run @pkl.swift/gen.pkl` into
#   Sources/CatbirdBrand/Generated/. One catbird_<Submodule>.pkl.swift
#   per Pkl submodule. Generator is Apple's pkl-swift v0.10.0.
# - Resource: tokens.json is the pkl eval output that Brand.swift
#   decodes at first access.
set -euo pipefail

PACKAGE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORKSPACE_ROOT="$(cd "$PACKAGE_ROOT/.." && pwd)"
TOKENS_DIR="${CATBIRD_BRAND_TOKENS_DIR:-$WORKSPACE_ROOT/docs/brand/tokens}"

GEN_OUT="$PACKAGE_ROOT/Sources/CatbirdBrand/Generated"
RES_OUT="$PACKAGE_ROOT/Sources/CatbirdBrand/Resources/tokens.json"

if [[ ! -d "$TOKENS_DIR" ]]; then
  echo "Error: $TOKENS_DIR not found" >&2
  exit 1
fi

# 1. Regenerate Swift types. Skip the top-level Catbird.pkl — its fields
#    are untyped module references that emit AnyHashable?; consumers use
#    the typed submodules directly.
if [[ -d "$GEN_OUT" ]]; then
  BACKUP_ROOT="$PACKAGE_ROOT/_trash/generated-$(date +%Y%m%d-%H%M%S)-$$"
  mkdir -p "$BACKUP_ROOT"
  mv "$GEN_OUT" "$BACKUP_ROOT/Generated"
fi
mkdir -p "$GEN_OUT"
pkl run package://pkg.pkl-lang.org/pkl-swift/pkl.swift@0.10.0#/gen.pkl \
  "$TOKENS_DIR/Color.pkl" \
  "$TOKENS_DIR/Space.pkl" \
  "$TOKENS_DIR/Radius.pkl" \
  "$TOKENS_DIR/Type.pkl" \
  "$TOKENS_DIR/Motion.pkl" \
  "$TOKENS_DIR/Material.pkl" \
  -o "$GEN_OUT/"

# 2. Regenerate the JSON snapshot resource.
mkdir -p "$(dirname "$RES_OUT")"
pkl eval "$TOKENS_DIR/Catbird.pkl" --format json | jq -S . > "$RES_OUT"

echo "Regenerated:"
ls "$GEN_OUT"
echo ""
echo "Snapshot: $RES_OUT ($(wc -c < "$RES_OUT") bytes)"
