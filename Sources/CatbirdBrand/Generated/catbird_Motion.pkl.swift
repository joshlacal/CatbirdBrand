// Code generated from Pkl module `catbird.Motion`. DO NOT EDIT.
import PklSwift

public enum catbird_Motion {}

extension catbird_Motion {
    /// Motion intent tokens. Each intent carries per-platform binding values
    /// that consumers expand into native curves at codegen time.
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Motion"

        public var instant: Binding

        public var enter: Binding

        public var exit: Binding

        public var emphasis: Binding

        public var gesture: Binding

        public init(
            instant: Binding,
            enter: Binding,
            exit: Binding,
            emphasis: Binding,
            gesture: Binding
        ) {
            self.instant = instant
            self.enter = enter
            self.exit = exit
            self.emphasis = emphasis
            self.gesture = gesture
        }
    }

    public struct Binding: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Motion#Binding"

        public var iosSwiftUI: String

        public var androidCompose: String

        public var cssTiming: String

        public var cssDurationMs: Int

        public init(
            iosSwiftUI: String,
            androidCompose: String,
            cssTiming: String,
            cssDurationMs: Int
        ) {
            self.iosSwiftUI = iosSwiftUI
            self.androidCompose = androidCompose
            self.cssTiming = cssTiming
            self.cssDurationMs = cssDurationMs
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Motion.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Motion.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Motion.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Motion.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}