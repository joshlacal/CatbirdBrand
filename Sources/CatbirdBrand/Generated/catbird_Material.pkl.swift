// Code generated from Pkl module `catbird.Material`. DO NOT EDIT.
import PklSwift

public enum catbird_Material {}

extension catbird_Material {
    /// Glass / surface material tokens.
    /// Apple platforms bind to SwiftUI Material / Liquid Glass.
    /// Android binds to M3 tonal elevation.
    /// Web binds to `backdrop-filter` feature-detected.
    /// Linux desktop: opaque fallback (no blur).
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Material"

        public var subtle: GlassBinding

        public var regular: GlassBinding

        public var strong: GlassBinding

        public init(subtle: GlassBinding, regular: GlassBinding, strong: GlassBinding) {
            self.subtle = subtle
            self.regular = regular
            self.strong = strong
        }
    }

    public struct GlassBinding: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Material#GlassBinding"

        public var iosSwiftUIMaterial: String

        public var androidElevationDp: Int

        public var androidSurfaceRole: String

        public var webBackdropFilter: String

        public init(
            iosSwiftUIMaterial: String,
            androidElevationDp: Int,
            androidSurfaceRole: String,
            webBackdropFilter: String
        ) {
            self.iosSwiftUIMaterial = iosSwiftUIMaterial
            self.androidElevationDp = androidElevationDp
            self.androidSurfaceRole = androidSurfaceRole
            self.webBackdropFilter = webBackdropFilter
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Material.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Material.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Material.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Material.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}