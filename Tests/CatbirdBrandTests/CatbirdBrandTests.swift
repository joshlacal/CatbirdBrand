import Foundation
import Testing
@testable import CatbirdBrand

// MARK: - WCAG 2.1 sRGB Contrast Helper

private func relativeLuminance(hex: String) -> Double {
    let cleaned = hex.trimmingCharacters(in: CharacterSet(charactersIn: "# "))
    precondition(cleaned.count == 6, "Expected 6-digit hex, got \(hex)")
    let value = UInt32(cleaned, radix: 16)!
    let r = Double((value >> 16) & 0xFF) / 255.0
    let g = Double((value >> 8) & 0xFF) / 255.0
    let b = Double(value & 0xFF) / 255.0

    func linearize(_ c: Double) -> Double {
        c <= 0.03928 ? c / 12.92 : pow((c + 0.055) / 1.055, 2.4)
    }

    return 0.2126 * linearize(r) + 0.7152 * linearize(g) + 0.0722 * linearize(b)
}

private func contrastRatio(_ fg: String, on bg: String) -> Double {
    let l1 = relativeLuminance(hex: fg)
    let l2 = relativeLuminance(hex: bg)
    let lighter = max(l1, l2)
    let darker = min(l1, l2)
    return (lighter + 0.05) / (darker + 0.05)
}

// MARK: - Core Token Parity Tests

@Test func packageVersionMatchesSchemaUpgrade() {
    #expect(Brand.version == "0.2.0")
}

@Test func catbirdAccentMatchesSpec() {
    #expect(Brand.color.catbird.accentLight == "#5192FF")
    #expect(Brand.color.catbird.accentDark == "#5192FF")
    #expect(Brand.color.catbird.gradientPartner == "#7FAEFF")
    #expect(Brand.color.catbird.onAccent.light == "#0B0D12")
    #expect(Brand.color.catbird.onAccent.dark == "#0B0D12")
}

@Test func catbirdTextAccentIsAANormalSafe() {
    // #005EFF clears WCAG AA-normal (≥4.5:1) on light canvas (#FFFFFF) and card (#F2F2F7).
    #expect(Brand.color.catbird.accentText == "#005EFF")
    #expect(Brand.color.catbird.accentTextDark == "#5192FF")
}

@Test func displayRoleIsExtendedWidth() {
    #expect(Brand.type.display.widthPercent == 125)
    #expect(Brand.type.display.weight == 800)
    #expect(Brand.type.headline.widthPercent == 100)
    #expect(Brand.type.body.widthPercent == 100)
}

@Test func wordmarkIsTheOnlyWeight900() {
    #expect(Brand.type.wordmark.weight == 900)
    #expect(Brand.type.display.weight == 800)
    #expect(Brand.type.headline.weight == 700)
}

@Test func radiusScaleMatchesAdoptedInAppScale() {
    #expect(Brand.radius.xs == 4)
    #expect(Brand.radius.sm == 8)
    #expect(Brand.radius.md == 12)
    #expect(Brand.radius.lg == 16)
    #expect(Brand.radius.xl == 24)
    #expect(Brand.radius.pill == 9999)
    #expect(Brand.radius.full == 9999)
}

@Test func spacingIsFourPointGrid() {
    #expect(Brand.space.fine == 2)
    #expect(Brand.space.s1 == 4)
    #expect(Brand.space.s2 == 8)
    #expect(Brand.space.s3 == 12)
    #expect(Brand.space.s4 == 16)
    #expect(Brand.space.s6 == 24)
    #expect(Brand.space.s16 == 64)
}

@Test func controlHeightsAndAvatarSizesAreTyped() {
    #expect(Brand.control.height.sm == 32)
    #expect(Brand.control.height.md == 40)
    #expect(Brand.control.height.lg == 48)
    #expect(Brand.control.height.minHitTarget == 44)

    #expect(Brand.control.avatar.xs == 24)
    #expect(Brand.control.avatar.sm == 32)
    #expect(Brand.control.avatar.md == 40)
    #expect(Brand.control.avatar.lg == 48)
    #expect(Brand.control.avatar.xl == 64)
    #expect(Brand.control.avatar.xxl == 96)
}

@Test func semanticsAreShared() {
    #expect(Brand.color.semantic.success == "#34C759")
    #expect(Brand.color.semantic.encryptionShield == "#34C759")
    #expect(Brand.color.semantic.danger == "#FF3B30")
    #expect(Brand.color.semantic.warning == "#FF9F0A")
}

@Test func lightDimAndTrueBlackSchemesAndBordersAreTyped() {
    // Light
    #expect(Brand.color.light.canvas == "#FFFFFF")
    #expect(Brand.color.light.card == "#F2F2F7")
    #expect(Brand.color.light.elevated == "#FFFFFF")
    #expect(Brand.color.light.grouped == "#F2F2F7")
    #expect(Brand.color.light.border == Brand.color.border.light)
    #expect(Brand.color.border.light.subtle == "#D1D1D6")
    #expect(Brand.color.border.light.prominent == "#76767B")

    // Dim
    #expect(Brand.color.dim.background == "#111318")
    #expect(Brand.color.dim.surface == "#1D1F26")
    #expect(Brand.color.dim.surfaceContainer == "#23252D")
    #expect(Brand.color.dim.surfaceContainerHigh == "#2A2D36")
    #expect(Brand.color.dim.border == Brand.color.border.dim)
    #expect(Brand.color.border.dim.subtle == "#323540")
    #expect(Brand.color.border.dim.prominent == "#6E7280")

    // True Black
    #expect(Brand.color.trueBlack.background == "#000000")
    #expect(Brand.color.trueBlack.surface == "#0A0A0A")
    #expect(Brand.color.trueBlack.surfaceContainer == "#121212")
    #expect(Brand.color.trueBlack.surfaceContainerHigh == "#1A1A1A")
    #expect(Brand.color.trueBlack.border == Brand.color.border.trueBlack)
    #expect(Brand.color.border.trueBlack.subtle == "#262629")
    #expect(Brand.color.border.trueBlack.prominent == "#636366")
}

@Test func sevenPalettesExist() {
    #expect(Brand.color.all.count == 7)
    #expect(Brand.color.all["catbird"]?.accentLight == "#5192FF")
}

@Test func allSevenPalettesPassWCAGAcrossAllThreeModes() {
    let light = Brand.color.light
    let dim = Brand.color.dim
    let black = Brand.color.trueBlack

    for (name, palette) in Brand.color.all {
        // Light mode text accent & onAccent ink
        #expect(contrastRatio(palette.accentText, on: light.canvas) >= 4.5, "\(name) accentText on light.canvas")
        #expect(contrastRatio(palette.accentText, on: light.card) >= 4.5, "\(name) accentText on light.card")
        #expect(contrastRatio(palette.onAccent.light, on: palette.accentLight) >= 4.5, "\(name) onAccent.light")

        // Dim mode text accent & onAccent ink
        #expect(contrastRatio(palette.accentTextDark, on: dim.background) >= 4.5, "\(name) accentTextDark on dim.background")
        #expect(contrastRatio(palette.accentTextDark, on: dim.surface) >= 4.5, "\(name) accentTextDark on dim.surface")
        #expect(contrastRatio(palette.accentTextDark, on: dim.surfaceContainer) >= 4.5, "\(name) accentTextDark on dim.surfaceContainer")
        #expect(contrastRatio(palette.onAccent.dark, on: palette.accentDark) >= 4.5, "\(name) onAccent.dark")

        // True Black mode text accent
        #expect(contrastRatio(palette.accentTextDark, on: black.background) >= 4.5, "\(name) accentTextDark on trueBlack.background")
        #expect(contrastRatio(palette.accentTextDark, on: black.surface) >= 4.5, "\(name) accentTextDark on trueBlack.surface")
        #expect(contrastRatio(palette.accentTextDark, on: black.surfaceContainer) >= 4.5, "\(name) accentTextDark on trueBlack.surfaceContainer")
    }

    // Neutral text & prominent borders
    #expect(contrastRatio(light.onSurface, on: light.card) >= 4.5)
    #expect(contrastRatio(light.onSurfaceVariant, on: light.card) >= 4.5)
    #expect(contrastRatio(dim.onSurface, on: dim.surfaceContainer) >= 4.5)
    #expect(contrastRatio(dim.onSurfaceVariant, on: dim.surfaceContainer) >= 4.5)
    #expect(contrastRatio(black.onSurface, on: black.surfaceContainer) >= 4.5)
    #expect(contrastRatio(black.onSurfaceVariant, on: black.surfaceContainer) >= 4.5)

    #expect(contrastRatio(light.border.prominent, on: light.card) >= 3.0)
    #expect(contrastRatio(dim.border.prominent, on: dim.surfaceContainer) >= 3.0)
    #expect(contrastRatio(black.border.prominent, on: black.surfaceContainer) >= 3.0)
}

@Test func motionStructuredNumericBindingsPresent() {
    #expect(Brand.motion.instant.kind == "smooth")
    #expect(Brand.motion.instant.duration == 0.15)
    #expect(Brand.motion.instant.response == nil)
    #expect(Brand.motion.instant.dampingFraction == nil)
    #expect(Brand.motion.instant.reduceMotionFallback == "crossfade")
    #expect(Brand.motion.instant.reduceMotionDuration == 0.15)
    #expect(Brand.motion.instant.cssDurationMs == 150)

    #expect(Brand.motion.enter.kind == "spring")
    #expect(Brand.motion.enter.duration == nil)
    #expect(Brand.motion.enter.response == 0.35)
    #expect(Brand.motion.enter.dampingFraction == 0.85)
    #expect(Brand.motion.enter.reduceMotionFallback == "linear")
    #expect(Brand.motion.enter.reduceMotionDuration == 0.2)
    #expect(Brand.motion.enter.cssDurationMs == 350)

    #expect(Brand.motion.exit.kind == "easeOut")
    #expect(Brand.motion.exit.duration == 0.22)
    #expect(Brand.motion.exit.response == nil)
    #expect(Brand.motion.exit.reduceMotionFallback == "linear")
    #expect(Brand.motion.exit.reduceMotionDuration == 0.18)

    #expect(Brand.motion.emphasis.kind == "spring")
    #expect(Brand.motion.emphasis.response == 0.4)
    #expect(Brand.motion.emphasis.dampingFraction == 0.65)
    #expect(Brand.motion.emphasis.reduceMotionFallback == "linear")
    #expect(Brand.motion.emphasis.reduceMotionDuration == 0.2)

    #expect(Brand.motion.gesture.kind == "interactiveSpring")
    #expect(Brand.motion.gesture.response == 0.15)
    #expect(Brand.motion.gesture.dampingFraction == 0.86)
    #expect(Brand.motion.gesture.reduceMotionFallback == "none")
    #expect(Brand.motion.gesture.reduceMotionDuration == 0.0)
}

@Test func materialBindingsPresent() {
    #expect(Brand.material.regular.iosSwiftUIMaterial == ".regularMaterial")
    #expect(Brand.material.regular.androidElevationDp == 3)
}
