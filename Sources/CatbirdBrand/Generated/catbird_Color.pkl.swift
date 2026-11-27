// Code generated from Pkl module `catbird.Color`. DO NOT EDIT.
import PklSwift

public enum catbird_Color {}

extension catbird_Color {
    /// Color tokens for the Catbird design system.
    ///
    /// Palette values for the six non-Catbird palettes were translated from iOS
    /// `ThemeManager.swift` sRGB values. Each palette carries light/dark chrome
    /// accents, WCAG AA-normal light/dark text accents, WCAG AA-normal foreground
    /// inks (`onAccent`), and a 135° gradient partner.
    public struct Module: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color"

        /// The canonical Catbird palette. Used as the user-facing default and
        /// as the brand gradient across all platforms.
        public var catbird: Palette

        /// Six user-selectable alternates. Every palette provides same-hue
        /// WCAG AA-normal (≥4.5:1) `accentText` / `accentTextDark` derivations
        /// and contrast-verified `onAccent` inks across Light, Dim, and True Black.
        public var twilight: Palette

        public var lavender: Palette

        public var sunrise: Palette

        public var aurora: Palette

        public var dusk: Palette

        public var midnight: Palette

        public var all: [String: Palette]

        /// Semantic colors — unchanged across palettes.
        public var semantic: Semantic

        public var border: BorderSchemes

        public var light: LightScheme

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
            border: BorderSchemes,
            light: LightScheme,
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
            self.border = border
            self.light = light
            self.dim = dim
            self.trueBlack = trueBlack
        }
    }

    public struct Palette: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#Palette"

        /// Chrome / fill accent for light mode. Selected tab bg, FAB,
        /// button fills, icons.
        public var accentLight: String

        /// Chrome / fill accent for dark mode. Same role as accentLight,
        /// lifted for contrast against dark surfaces.
        public var accentDark: String

        /// Text-safe accent for light mode. Inline links, @mentions,
        /// hashtags, accent-colored text at body size and regular weight.
        /// Clears WCAG AA-normal (≥4.5:1) on both light canvas (`#FFFFFF`)
        /// and light card (`#F2F2F7`) surfaces.
        public var accentText: String

        /// Text-safe accent for dark mode. Same role as accentText on the
        /// dim and true-black dark surfaces (≥4.5:1 on background, surface,
        /// and surfaceContainer).
        public var accentTextDark: String

        /// Lighter stop of the brand gradient (accentLight → gradientPartner
        /// at 135°). Stays constant across light and dark modes.
        public var gradientPartner: String

        /// WCAG AA-normal (≥4.5:1) foreground ink on chrome accent fills.
        public var onAccent: OnAccent

        public init(
            accentLight: String,
            accentDark: String,
            accentText: String,
            accentTextDark: String,
            gradientPartner: String,
            onAccent: OnAccent
        ) {
            self.accentLight = accentLight
            self.accentDark = accentDark
            self.accentText = accentText
            self.accentTextDark = accentTextDark
            self.gradientPartner = gradientPartner
            self.onAccent = onAccent
        }
    }

    /// WCAG AA-normal (≥4.5:1) foreground ink drawn on top of a palette's chrome
    /// accent fill in light and dark modes (`#FFFFFF` or `#0B0D12`).
    public struct OnAccent: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#OnAccent"

        /// Foreground ink on `accentLight`.
        public var light: String

        /// Foreground ink on `accentDark`.
        public var dark: String

        public init(light: String, dark: String) {
            self.light = light
            self.dark = dark
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

    /// Mode-indexed border tokens across Light, Dim, and True Black.
    public struct BorderSchemes: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#BorderSchemes"

        public var light: Border

        public var dim: Border

        public var trueBlack: Border

        public init(light: Border, dim: Border, trueBlack: Border) {
            self.light = light
            self.dim = dim
            self.trueBlack = trueBlack
        }
    }

    /// Hairline and prominent border tokens for one theme mode.
    public struct Border: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#Border"

        /// Decorative hairline / subtle card boundary.
        public var subtle: String

        /// High-contrast / interactive control boundary (≥3.0:1 against surface).
        public var prominent: String

        public init(subtle: String, prominent: String) {
            self.subtle = subtle
            self.prominent = prominent
        }
    }

    /// Light-mode surface and foreground tokens.
    public struct LightScheme: PklRegisteredType, Decodable, Hashable, Sendable {
        public static let registeredIdentifier: String = "catbird.Color#LightScheme"

        public var canvas: String

        public var card: String

        public var elevated: String

        public var grouped: String

        public var onSurface: String

        public var onSurfaceVariant: String

        public var border: Border

        public init(
            canvas: String,
            card: String,
            elevated: String,
            grouped: String,
            onSurface: String,
            onSurfaceVariant: String,
            border: Border
        ) {
            self.canvas = canvas
            self.card = card
            self.elevated = elevated
            self.grouped = grouped
            self.onSurface = onSurface
            self.onSurfaceVariant = onSurfaceVariant
            self.border = border
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

        public var border: Border

        public init(
            background: String,
            surface: String,
            surfaceContainer: String,
            surfaceContainerHigh: String,
            onSurface: String,
            onSurfaceVariant: String,
            border: Border
        ) {
            self.background = background
            self.surface = surface
            self.surfaceContainer = surfaceContainer
            self.surfaceContainerHigh = surfaceContainerHigh
            self.onSurface = onSurface
            self.onSurfaceVariant = onSurfaceVariant
            self.border = border
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