// Code generated from Pkl module `catbird.Color`. DO NOT EDIT.
import PklSwift

public enum catbird_Color {}

extension catbird_Color {
    /// Color tokens for the Catbird design system.
    ///
    /// Palette values for the six non-Catbird palettes were translated from the
    /// current iOS `ThemeManager.swift` sRGB values. Each palette carries a
    /// light-mode accent, a dark-mode accent, and a gradient partner. The
    /// gradient partner is the lighter stop of the palette's 135° linear
    /// gradient; the light-mode accent is the darker stop.
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color"

        /// The canonical Catbird palette. Used as the user-facing default and
        /// as the brand gradient across all platforms.
        public var catbird: Palette

        /// Six user-selectable alternates. Text-tier fields default to the
        /// chrome values in the current set — picking a non-Catbird palette is
        /// an aesthetic choice that accepts sub-AA-normal contrast for inline
        /// accent text. If we ever ship an "accessible palettes" mode, this is
        /// where per-palette accentText/accentTextDark values would be filled
        /// in with AA-normal-compliant derivations.
        public var twilight: Palette

        public var lavender: Palette

        public var sunrise: Palette

        public var aurora: Palette

        public var dusk: Palette

        public var midnight: Palette

        public var all: [String: Palette]

        /// Semantic colors — unchanged across palettes.
        public var semantic: Semantic

        public var dim: DarkScheme

        public var trueBlack: DarkScheme

        public init(
            catbird: Palette,
            twilight: Palette,
            lavender: Palette,
            sunrise: Palette,
            aurora: Palette,
            dusk: Palette,
            midnight: Palette,
            all: [String: Palette],
            semantic: Semantic,
            dim: DarkScheme,
            trueBlack: DarkScheme
        ) {
            self.catbird = catbird
            self.twilight = twilight
            self.lavender = lavender
            self.sunrise = sunrise
            self.aurora = aurora
            self.dusk = dusk
            self.midnight = midnight
            self.all = all
            self.semantic = semantic
            self.dim = dim
            self.trueBlack = trueBlack
        }
    }

    public struct Palette: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#Palette"

        /// Chrome / fill accent for light mode. Selected tab bg, FAB,
        /// button fills, icons. May sit at AA-large only on white; text
        /// rendered on top of this color is typically ≥18pt or ≥14pt bold,
        /// which is the AA-large threshold.
        public var accentLight: String

        /// Chrome / fill accent for dark mode. Same role as accentLight,
        /// lifted for contrast against dark surfaces.
        public var accentDark: String

        /// Text-safe accent for light mode. Inline links, @mentions,
        /// hashtags, accent-colored text at body size and regular weight.
        /// Must clear WCAG AA-normal (≥4.5:1) on white and the common
        /// light-surface background.
        public var accentText: String

        /// Text-safe accent for dark mode. Same role as accentText on the
        /// dim / true-black dark surfaces.
        public var accentTextDark: String

        /// Lighter stop of the brand gradient (accentLight → gradientPartner
        /// at 135°). Stays constant across light and dark modes.
        public var gradientPartner: String

        public init(
            accentLight: String,
            accentDark: String,
            accentText: String,
            accentTextDark: String,
            gradientPartner: String
        ) {
            self.accentLight = accentLight
            self.accentDark = accentDark
            self.accentText = accentText
            self.accentTextDark = accentTextDark
            self.gradientPartner = gradientPartner
        }
    }

    public struct Semantic: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#Semantic"

        public var success: String

        public var warning: String

        public var danger: String

        public var encryptionShield: String

        public init(success: String, warning: String, danger: String, encryptionShield: String) {
            self.success = success
            self.warning = warning
            self.danger = danger
            self.encryptionShield = encryptionShield
        }
    }

    /// Dark-mode surface tokens.
    public struct DarkScheme: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#DarkScheme"

        public var background: String

        public var surface: String

        public var surfaceContainer: String

        public var surfaceContainerHigh: String

        public var onSurface: String

        public var onSurfaceVariant: String

        public init(
            background: String,
            surface: String,
            surfaceContainer: String,
            surfaceContainerHigh: String,
            onSurface: String,
            onSurfaceVariant: String
        ) {
            self.background = background
            self.surface = surface
            self.surfaceContainer = surfaceContainer
            self.surfaceContainerHigh = surfaceContainerHigh
            self.onSurface = onSurface
            self.onSurfaceVariant = onSurfaceVariant
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `catbird_Color.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> catbird_Color.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `catbird_Color.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> catbird_Color.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}