// Code generated from Pkl module `catbird.Motion`. DO NOT EDIT.
import PklSwift

public enum catbird_Motion {}

extension catbird_Motion {
    /// Motion intent tokens. Each intent carries structured numeric curve
    /// parameters (so Swift and other consumers never hand-copy constants)
    /// alongside per-platform binding snippets.
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

        /// Curve kind: "smooth" | "spring" | "easeOut" | "interactiveSpring"
        public var kind: String

        /// Timed animation duration in seconds; null for spring curves.
        public var duration: Float64?

        /// Spring response in seconds; null for timed curves.
        public var response: Float64?

        /// Spring damping fraction (0..1+); null for timed curves.
        public var dampingFraction: Float64?

        /// Reduce Motion behavior per 05-motion.md: "crossfade" | "linear" | "none"
        public var reduceMotionFallback: String

        /// Duration in seconds when Reduce Motion is active (0.0 for "none").
        public var reduceMotionDuration: Float64

        /// Platform reference expressions (retained for compatibility & docs).
        public var iosSwiftUI: String

        public var androidCompose: String

        public var cssTiming: String

        public var cssDurationMs: Int

        public init(
            kind: String,
            duration: Float64?,
            response: Float64?,
            dampingFraction: Float64?,
            reduceMotionFallback: String,
            reduceMotionDuration: Float64,
            iosSwiftUI: String,
            androidCompose: String,
            cssTiming: String,
            cssDurationMs: Int
        ) {
            self.kind = kind
            self.duration = duration
            self.response = response
            self.dampingFraction = dampingFraction
            self.reduceMotionFallback = reduceMotionFallback
            self.reduceMotionDuration = reduceMotionDuration
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