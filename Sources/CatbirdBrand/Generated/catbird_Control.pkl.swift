// Code generated from Pkl module `catbird.Control`. DO NOT EDIT.
import PklSwift

public enum catbird_Control {}

extension catbird_Control {
    /// Control height and avatar sizing tokens on the 4pt grid.
    /// Visual control heights stay compact (32 / 40 / 48pt) while interactive
    /// hit targets always enforce `height.minHitTarget` (44pt on iOS).
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Control"

        public var height: ControlHeight

        public var avatar: AvatarSize

        public init(height: ControlHeight, avatar: AvatarSize) {
            self.height = height
            self.avatar = avatar
        }
    }

    public struct ControlHeight: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Control#ControlHeight"

        public var sm: Int

        public var md: Int

        public var lg: Int

        public var minHitTarget: Int

        public init(sm: Int, md: Int, lg: Int, minHitTarget: Int) {
            self.sm = sm
            self.md = md
            self.lg = lg
            self.minHitTarget = minHitTarget
        }
    }

    public struct AvatarSize: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Control#AvatarSize"

        public var xs: Int

        public var sm: Int

        public var md: Int

        public var lg: Int

        public var xl: Int

        public var xxl: Int

        public init(xs: Int, sm: Int, md: Int, lg: Int, xl: Int, xxl: Int) {
            self.xs = xs
            self.sm = sm
            self.md = md
            self.lg = lg
            self.xl = xl
            self.xxl = xxl
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Control.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Control.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Control.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Control.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}