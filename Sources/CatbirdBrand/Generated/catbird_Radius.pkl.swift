// Code generated from Pkl module `catbird.Radius`. DO NOT EDIT.
import PklSwift

public enum catbird_Radius {}

extension catbird_Radius {
    /// Corner radius scale. All rounded corners render as continuous
    /// (squircle) curves where the platform supports it.
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Radius"

        public var xs: Int

        public var sm: Int

        public var md: Int

        public var lg: Int

        public var xl: Int

        /// Render as `9999` in layout code; consumers treat as "50% for circles".
        public var full: Int

        public init(xs: Int, sm: Int, md: Int, lg: Int, xl: Int, full: Int) {
            self.xs = xs
            self.sm = sm
            self.md = md
            self.lg = lg
            self.xl = xl
            self.full = full
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Radius.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Radius.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Radius.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Radius.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}