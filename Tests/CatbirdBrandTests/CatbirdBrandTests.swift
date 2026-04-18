import Testing
@testable import CatbirdBrand

@Test func catbirdAccentMatchesSpec() {
    #expect(Brand.color.catbird.accentLight == "#5192FF")
    #expect(Brand.color.catbird.accentDark == "#5192FF")
    #expect(Brand.color.catbird.gradientPartner == "#7FAEFF")
}

@Test func catbirdTextAccentIsAANormalSafe() {
    // #005EFF clears WCAG AA-normal (≥4.5:1) on white at 5.19:1.
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

@Test func radiusScaleMatchesSpec() {
    #expect(Brand.radius.xs == 6)
    #expect(Brand.radius.sm == 10)
    #expect(Brand.radius.md == 14)
    #expect(Brand.radius.lg == 20)
    #expect(Brand.radius.xl == 28)
    #expect(Brand.radius.full == 9999)
}

@Test func spacingIsFourPointGrid() {
    #expect(Brand.space.fine == 2)
    #expect(Brand.space.s1 == 4)
    #expect(Brand.space.s4 == 16)
    #expect(Brand.space.s16 == 64)
}

@Test func semanticsAreShared() {
    #expect(Brand.color.semantic.success == "#34C759")
    #expect(Brand.color.semantic.encryptionShield == "#34C759")
    #expect(Brand.color.semantic.danger == "#FF3B30")
    #expect(Brand.color.semantic.warning == "#FF9F0A")
}

@Test func darkSchemesAreTyped() {
    #expect(Brand.color.dim.background == "#111318")
    #expect(Brand.color.trueBlack.background == "#000000")
    #expect(Brand.color.trueBlack.surface == "#0A0A0A")
}

@Test func sevenPalettesExist() {
    #expect(Brand.color.all.count == 7)
    #expect(Brand.color.all["catbird"]?.accentLight == "#5192FF")
}

@Test func motionBindingsPresent() {
    #expect(Brand.motion.enter.cssDurationMs == 350)
    #expect(Brand.motion.instant.cssDurationMs == 150)
}

@Test func materialBindingsPresent() {
    #expect(Brand.material.regular.iosSwiftUIMaterial == ".regularMaterial")
    #expect(Brand.material.regular.androidElevationDp == 3)
}
