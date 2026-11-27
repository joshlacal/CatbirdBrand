# CatbirdBrand

Swift package exposing generated Catbird design-system tokens to iOS, iPadOS, watchOS, macOS, tvOS, and visionOS apps.

## Documentation

API reference (DocC): <https://joshlacal.github.io/CatbirdBrand/>. Build it locally with `Scripts/build-docs-site.sh`.

## What's inside

- `Sources/CatbirdBrand/Generated/` — Swift types emitted by `pkl run @pkl.swift/gen.pkl` against the Pkl modules at `../docs/brand/tokens/`. Do not hand-edit.
- `Sources/CatbirdBrand/Resources/tokens.json` — `pkl eval` output of `Catbird.pkl`. Bundled as a Swift Package resource.
- `Sources/CatbirdBrand/Brand.swift` — thin public API: `Brand.color`, `Brand.type`, `Brand.space`, `Brand.radius`, `Brand.control`, `Brand.motion`, `Brand.material`. Values are lazily decoded from the bundled JSON at first access.
- `Scripts/generate.sh` — regenerates both the Swift types and the JSON snapshot from the source-of-truth Pkl modules. Supports `CATBIRD_BRAND_TOKENS_DIR` for isolated workspace regeneration.

## Usage

```swift
import CatbirdBrand

let accent = Brand.color.catbird.accentLight       // "#5192FF"
let onAccent = Brand.color.catbird.onAccent.light  // "#0B0D12"
let radius = Brand.radius.md                       // 12
let minHit = Brand.control.height.minHitTarget     // 44
let enterResponse = Brand.motion.enter.response    // 0.35
let displayWidth = Brand.type.display.widthPercent // 125
```

## Regenerating

```bash
./Scripts/generate.sh
swift test
```

CI verifies that regeneration matches the checked-in snapshot and generated Swift files, passes WCAG AA contrast checks, and passes all package tests.

## Dependency

This package depends on [apple/pkl-swift](https://github.com/apple/pkl-swift) for the generated types' `PklCodingKey` decoding. The PklSwift runtime is only used for JSON decoding in this package — no live Pkl evaluation is performed at runtime.
