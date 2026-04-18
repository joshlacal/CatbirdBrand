// Code generated from Pkl module `catbird.Type`. DO NOT EDIT.
import PklSwift

public enum catbird_Type {}

extension catbird_Type {
    /// Typography tokens. Fonts are platform-specific; scale roles
    /// (display / headline / title / body / caption) are shared.
    /// Extended width (125%) applies only to the `display` role.
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Type"

        public var primary: FontFamily

        public var display: Role

        public var headline: Role

        public var title: Role

        public var body: Role

        public var caption: Role

        /// Wordmark — the one place weight 900 is allowed.
        public var wordmark: Role

        public init(
            primary: FontFamily,
            display: Role,
            headline: Role,
            title: Role,
            body: Role,
            caption: Role,
            wordmark: Role
        ) {
            self.primary = primary
            self.display = display
            self.headline = headline
            self.title = title
            self.body = body
            self.caption = caption
            self.wordmark = wordmark
        }
    }

    public struct FontFamily: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Type#FontFamily"

        public var apple: String

        public var android: String

        public var webStack: String

        public init(apple: String, android: String, webStack: String) {
            self.apple = apple
            self.android = android
            self.webStack = webStack
        }
    }

    public struct Role: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Type#Role"

        public var minSize: Int

        public var maxSize: Int

        public var weight: Int

        public var widthPercent: Int

        public var trackingEm: Float64

        public var useDisplayFont: Bool

        public init(
            minSize: Int,
            maxSize: Int,
            weight: Int,
            widthPercent: Int,
            trackingEm: Float64,
            useDisplayFont: Bool
        ) {
            self.minSize = minSize
            self.maxSize = maxSize
            self.weight = weight
            self.widthPercent = widthPercent
            self.trackingEm = trackingEm
            self.useDisplayFont = useDisplayFont
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Type.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Type.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Type.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Type.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}