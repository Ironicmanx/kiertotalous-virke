# Foundation Formula Fixes

Six bugs were found and fixed in the foundation calculation formulas. All originated from the original reference Excel spreadsheet — wrong cell references that got carried over into code.

All 18 foundation tests pass after fixes.

---

## BUG 1 — HollowCoreSlab: steel density used as total density (CRITICAL)

**File:** `lib/src/large_properties/demolition_materials/foundation_and_floors_demolition_materials.dart`  
**Class:** `ReinforcedConcreteColumnHollowCoreSlabFoundation`

**Problem:** `kgPerCubicMeter` pointed to `reinforcedConcreteColumn250x250SteelKgPerCbm` (100 kg/m³) instead of `reinforcedConcreteColumn250x250KgPerCbm` (2500 kg/m³). Both `kgPerCubicMeter` and `steelKgPerCubicMeter` were identical, meaning:
- Volume was inflated 25× (divides by 100 instead of 2500)
- `concreteTons` always equaled 0 (`volume * 100 - volume * 100 = 0`)

**Fix:** Changed `kgPerCubicMeter` to use `reinforcedConcreteColumn250x250KgPerCbm` (2500), matching the equivalent pillar foundation class (`ReinforcedConcreteColumnColumnFoundation`).

---

## BUG 2 — All 4 FinnFoam classes use wrong material weights (CRITICAL)

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

## BUG 3 — CrawlSpace: solidBoardingAndWoodFrameTons doubled woodFrame, lost solidBoarding

**File:** `lib/src/large_properties/external_shell_and_frame_structures/foundation/crawl_space_foundation.dart`

**Problem:** `solidBoardingAndWoodFrameTons` summed `_woodFrameCrawlSpaceGroundFloor.tons` twice instead of `_woodFrameCrawlSpaceGroundFloor.tons + _solidBoardingCrawlSpaceGroundFloor.tons`. The volume getter was correct.

**Fix:** Changed second `_woodFrameCrawlSpaceGroundFloor.tons` to `_solidBoardingCrawlSpaceGroundFloor.tons`.

With area=100: 0.62 → 2.31 (woodFrame 0.31 + solidBoarding 2.0).

---

## BUG 4 — CrawlSpace: concreteTons double-counted the ground floor slab

**File:** `lib/src/large_properties/external_shell_and_frame_structures/foundation/crawl_space_foundation.dart`

**Problem:** When material was `concreteCasting`, the formula summed both `.concreteTons` and `.tons` from the same `_reinforcedConcreteSlabFalsePlinthGroundFloor` instance. For this class, `.concreteTons` and `.tons` compute to the identical value, so the slab contribution was counted twice.

For comparison: `FalsePlinthFoundation` uses `.tons` once, `ShallowFoundation` uses `.concreteTons` once — neither double-counts.

**Fix:** Use `.concreteTons` once (unconditionally, since the slab always exists). The foundation wall `.tons` is still only added when material is `concreteCasting`.

With area=100, circumference=100: 70 → 45 (slab 25 once + foundation walls 20).

---

## BUG 5 — ShallowFoundation: plasticWasteTons missing styrofoam ground floor

**File:** `lib/src/large_properties/external_shell_and_frame_structures/foundation/shallow_foundation.dart`

**Problem:** `plasticWasteVolume` included all 4 components (frostProofStyrofoam, FinnFoam, vaporBarrier, styrofoamGroundFloor), but `plasticWasteTons` only summed 3 — `_styrofoamShallowFoundationGroundFloor.tons` was missing. Had a TODO comment acknowledging it felt wrong.

**Fix:** Added `_styrofoamShallowFoundationGroundFloor.tons` to the sum, making tons consistent with volume.

---

## BUG 6 — PillarFoundation: wood frame kgPerSquareMeter used ceramic tile weight

**File:** `lib/src/large_properties/demolition_materials/foundation_and_floors_demolition_materials.dart`  
**Class:** `WoodFrameColumnFoundationGroundFloor`

**Problem:** `kgPerSquareMeter` used `CellarStructureWeights.ceramicTileKgPerSqm` (16 kg/m²) instead of `ExteriorWallWeights.woodFrame45x100mmKgPerSqm` (3.1 kg/m²). The equivalent crawl space class (`WoodFrameCrawlSpaceGroundFloor`) uses the correct wood frame constant.

**Fix:** Changed to `ExteriorWallWeights.woodFrame45x100mmKgPerSqm`. Note: this field is only used for display — the `volume` and `tons` getters use `sizing` directly, so tonnage output was not affected.
