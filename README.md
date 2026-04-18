# CatbirdBrand

Swift package exposing generated Catbird design-system tokens to iOS, iPadOS, watchOS, macOS, tvOS, and visionOS apps.

## What's inside

- `Sources/CatbirdBrand/Generated/` — Swift types emitted by `pkl run @pkl.swift/gen.pkl` against the Pkl modules at `../docs/brand/tokens/`. Do not hand-edit.
- `Sources/CatbirdBrand/Resources/tokens.json` — `pkl eval` output of `Catbird.pkl`. Bundled as a Swift Package resource.
- `Sources/CatbirdBrand/Brand.swift` — thin public API: `Brand.color`, `Brand.type`, `Brand.space`, `Brand.radius`, `Brand.motion`, `Brand.material`. Values are lazily decoded from the bundled JSON at first access.
- `Scripts/generate.sh` — regenerates both the Swift types and the JSON snapshot from the source-of-truth Pkl modules. Run after any token change.

## Usage

```swift
import CatbirdBrand

let accent = Brand.color.catbird.accentLight      // "#143F9C"
let radius = Brand.radius.md                      // 14
let displayWidth = Brand.type.display.widthPercent // 125
```

## Regenerating

```bash
./Scripts/generate.sh
swift test
```

CI verifies both that regeneration produces the same output as the checked-in snapshot, and that all token tests pass.

## Dependency

This package depends on [apple/pkl-swift](https://github.com/apple/pkl-swift) for the generated types' `PklCodingKey` decoding. The PklSwift runtime is only used for JSON decoding in this package — no live Pkl evaluation is performed at runtime.
