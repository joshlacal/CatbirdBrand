import Foundation

/// Single source of truth for Catbird brand tokens.
///
/// The bundled `tokens.json` resource is the output of
/// `pkl eval docs/brand/tokens/Catbird.pkl --format json`, regenerated
/// by `Scripts/generate.sh`. Typed views come from the `pkl-swift`
/// generated Swift under `Generated/`.
public enum Brand {
    /// Raw JSON bytes of the tokens snapshot. Exposed for tooling that
    /// wants to decode into alternate shapes.
    public static let tokensData: Data = {
        guard let url = Bundle.module.url(forResource: "tokens", withExtension: "json") else {
            fatalError("CatbirdBrand: tokens.json missing — regenerate with Scripts/generate.sh")
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            fatalError("CatbirdBrand: failed to read tokens.json — \(error)")
        }
    }()

    public static let color:    catbird_Color.Module    = decodeSlice(key: "color")
    public static let space:    catbird_Space.Module    = decodeSlice(key: "space")
    public static let radius:   catbird_Radius.Module   = decodeSlice(key: "radius")
    public static let type:     catbird_Type.Module     = decodeSlice(key: "type")
    public static let motion:   catbird_Motion.Module   = decodeSlice(key: "motion")
    public static let material: catbird_Material.Module = decodeSlice(key: "material")

    public static let version: String = {
        struct Env: Decodable { let version: String }
        return (try? JSONDecoder().decode(Env.self, from: tokensData))?.version ?? "unknown"
    }()

    private static func decodeSlice<T: Decodable>(key: String) -> T {
        guard
            let root = try? JSONSerialization.jsonObject(with: tokensData) as? [String: Any],
            let slice = root[key]
        else {
            fatalError("CatbirdBrand: tokens.json missing top-level key \(key)")
        }
        do {
            let sliceData = try JSONSerialization.data(withJSONObject: slice)
            return try JSONDecoder().decode(T.self, from: sliceData)
        } catch {
            fatalError("CatbirdBrand: failed to decode \(key) into \(T.self) — \(error)")
        }
    }
}
