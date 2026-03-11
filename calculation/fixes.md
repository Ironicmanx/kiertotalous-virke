# Foundation & Excavation Formula Fixes

7 bugs were found and fixed in the calculation formulas. All originated from the original reference Excel spreadsheet — wrong cell references that got carried over into code.

All 18 foundation tests pass after fixes.

---

## Summary for review

| # | Severity | One-liner |
|---|----------|-----------|
| 1 | 🔴 Critical | Hollow core slab foundation used steel-only density (100) instead of full concrete density (2500), making volume 25× too large and concrete output always zero. |
| 2 | 🔴 Critical | All 4 FinnFoam insulation classes referenced random unrelated materials (brick, fiberboard, etc.) instead of the existing FinnFoam constant — errors ranged from 6× to 78×. |
| 3 | 🟠 High | Crawl space wood tonnage accidentally summed the wood frame twice instead of wood frame + solid boarding, losing half the output. |
| 4 | 🟠 High | Crawl space concrete tonnage counted the ground floor slab twice by summing both `.tons` and `.concreteTons` from the same object (which return the same value). |
| 5 | 🟡 Medium | Shallow foundation plastic waste tons was missing one of its four components (styrofoam ground floor) even though the volume calculation included it. |
| 6 | 🟡 Medium | Pillar foundation wood frame displayed ceramic tile weight (16 kg/m²) instead of wood frame weight (3.1 kg/m²) — display-only, didn't affect tonnage output. |
| 7 | 🟠 High | Contaminated soil tons were 1000× too large — formula was missing the `/ 1000` kg-to-tons conversion that the clean soil formula had. |

---

## Detailed descriptions

### BUG 1 — HollowCoreSlab: steel density used as total density (CRITICAL)

**File:** `lib/src/large_properties/demolition_materials/foundation_and_floors_demolition_materials.dart`  
**Class:** `ReinforcedConcreteColumnHollowCoreSlabFoundation`

**Problem:** `kgPerCubicMeter` pointed to `reinforcedConcreteColumn250x250SteelKgPerCbm` (100 kg/m³) instead of `reinforcedConcreteColumn250x250KgPerCbm` (2500 kg/m³). Both `kgPerCubicMeter` and `steelKgPerCubicMeter` were identical, meaning:
- Volume was inflated 25× (divides by 100 instead of 2500)
- `concreteTons` always equaled 0 (`volume * 100 - volume * 100 = 0`)

**Fix:** Changed `kgPerCubicMeter` to use `reinforcedConcreteColumn250x250KgPerCbm` (2500), matching the equivalent pillar foundation class (`ReinforcedConcreteColumnColumnFoundation`).

---

### BUG 2 — All 4 FinnFoam classes use wrong material weights (CRITICAL)

**File:** `lib/src/large_properties/demolition_materials/foundation_and_floors_demolition_materials.dart`  
**Classes:** `FinnFoamFalsePlinth`, `FinnFoamShallowFoundation`, `FinnFoamColumnFoundation`, `FinnFoamHollowCoreSlabFoundation`

**Problem:** FinnFoam is XPS insulation (~32 kg/m³). A dedicated constant exists (`FoundationWeights.finnFoam50mmKgPerCbm = 32`) but was never used. Each class grabbed a random unrelated material:

| Class | Wrong constant used | kg/m³ | Error vs correct (32) |
|---|---|---|---|
| FalsePlinth | frostProofStyrofoam100mm | 5.4 | 6× too light |
| ShallowFoundation | woodFrame45x100mm | 500 | 16× too heavy |
| ColumnFoundation | hardDisk (fiberboard) | 460 | 14× too heavy |
| HollowCoreSlabFoundation | limeSandBrick130mm | 2500 | 78× too heavy |

**Fix:** All 4 classes now use `FoundationWeights.finnFoam50mmKgPerCbm` (32 kg/m³) and `FoundationWeights.finnFoam50mmKgPerSqm / 50 * sizing` for kg/m², following the same scaling pattern as the `FrostProofStyrofoam` classes.

---

### BUG 3 — CrawlSpace: solidBoardingAndWoodFrameTons doubled woodFrame, lost solidBoarding

**File:** `lib/src/large_properties/external_shell_and_frame_structures/foundation/crawl_space_foundation.dart`

**Problem:** `solidBoardingAndWoodFrameTons` summed `_woodFrameCrawlSpaceGroundFloor.tons` twice instead of `_woodFrameCrawlSpaceGroundFloor.tons + _solidBoardingCrawlSpaceGroundFloor.tons`. The volume getter was correct.

**Fix:** Changed second `_woodFrameCrawlSpaceGroundFloor.tons` to `_solidBoardingCrawlSpaceGroundFloor.tons`.

With area=100: 0.62 → 2.31 (woodFrame 0.31 + solidBoarding 2.0).

---

### BUG 4 — CrawlSpace: concreteTons double-counted the ground floor slab

**File:** `lib/src/large_properties/external_shell_and_frame_structures/foundation/crawl_space_foundation.dart`

**Problem:** When material was `concreteCasting`, the formula summed both `.concreteTons` and `.tons` from the same `_reinforcedConcreteSlabFalsePlinthGroundFloor` instance. For this class, `.concreteTons` and `.tons` compute to the identical value, so the slab contribution was counted twice.

For comparison: `FalsePlinthFoundation` uses `.tons` once, `ShallowFoundation` uses `.concreteTons` once — neither double-counts.

**Fix:** Use `.concreteTons` once (unconditionally, since the slab always exists). The foundation wall `.tons` is still only added when material is `concreteCasting`.

With area=100, circumference=100: 70 → 45 (slab 25 once + foundation walls 20).

---

### BUG 5 — ShallowFoundation: plasticWasteTons missing styrofoam ground floor

**File:** `lib/src/large_properties/external_shell_and_frame_structures/foundation/shallow_foundation.dart`

**Problem:** `plasticWasteVolume` included all 4 components (frostProofStyrofoam, FinnFoam, vaporBarrier, styrofoamGroundFloor), but `plasticWasteTons` only summed 3 — `_styrofoamShallowFoundationGroundFloor.tons` was missing. Had a TODO comment acknowledging it felt wrong.

**Fix:** Added `_styrofoamShallowFoundationGroundFloor.tons` to the sum, making tons consistent with volume.

---

### BUG 6 — PillarFoundation: wood frame kgPerSquareMeter used ceramic tile weight

**File:** `lib/src/large_properties/demolition_materials/foundation_and_floors_demolition_materials.dart`  
**Class:** `WoodFrameColumnFoundationGroundFloor`

**Problem:** `kgPerSquareMeter` used `CellarStructureWeights.ceramicTileKgPerSqm` (16 kg/m²) instead of `ExteriorWallWeights.woodFrame45x100mmKgPerSqm` (3.1 kg/m²). The equivalent crawl space class (`WoodFrameCrawlSpaceGroundFloor`) uses the correct wood frame constant.

**Fix:** Changed to `ExteriorWallWeights.woodFrame45x100mmKgPerSqm`. Note: this field is only used for display — the `volume` and `tons` getters use `sizing` directly, so tonnage output was not affected.

---

### BUG 7 — ExcavationArea: contaminatedLandTons missing / 1000 conversion (HIGH)

**File:** `lib/src/large_properties/external_shell_and_frame_structures/excavation_area.dart`

**Problem:** `contaminatedLandTons` multiplied `volume × fraction × 1500` but forgot to divide by 1000 to convert kg → tons. The equivalent `cleanLandTons` formula had the `/ 1000` correctly.

**Fix:** Added `/ 1000` to match `cleanLandTons`.

With area=250, depth=2, cleanPortion=50%: 375,000 → 375 tons.



