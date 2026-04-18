// Code generated from Pkl module `catbird.Space`. DO NOT EDIT.
import PklSwift

public enum catbird_Space {}

extension catbird_Space {
    /// Spacing scale for the Catbird design system.
    /// Primary grid is 4pt. `fine = 2pt` exists only for hairlines and
    /// sub-icon gaps; structural layout never uses `fine`.
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Space"

        public var fine: Int

        public var s1: Int

        public var s2: Int

        public var s3: Int

        public var s4: Int

        public var s5: Int

        public var s6: Int

        public var s8: Int

        public var s10: Int

        public var s12: Int

        public var s16: Int

        public init(
            fine: Int,
            s1: Int,
            s2: Int,
            s3: Int,
            s4: Int,
            s5: Int,
            s6: Int,
            s8: Int,
            s10: Int,
            s12: Int,
            s16: Int
        ) {
            self.fine = fine
            self.s1 = s1
            self.s2 = s2
            self.s3 = s3
            self.s4 = s4
            self.s5 = s5
            self.s6 = s6
            self.s8 = s8
            self.s10 = s10
            self.s12 = s12
            self.s16 = s16
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Space.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Space.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Space.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Space.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}