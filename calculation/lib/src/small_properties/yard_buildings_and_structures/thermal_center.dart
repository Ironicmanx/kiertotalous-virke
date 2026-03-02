import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bl_demolition_materials/src/small_properties/data_types/exports.dart';
import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';
import '../data_types/garage_wall_material.dart';
import '../data_types/heating_type.dart';
import 'carport_or_garage.dart';

part 'thermal_center.freezed.dart';
part 'thermal_center.g.dart';

/// Piharakennukset ja rakenteet
/// Lämpökeskus
@freezed
abstract class ThermalCenter with _$ThermalCenter {
  const ThermalCenter._();

  const factory ThermalCenter(
      {@Default(false) onDisctrictOrDirectHeating,
      num? concreteLengthInMeters,
      num? concreteWidthInMeters,
      num? plinthHeightInMeters,
      num? wallHeightInMeters,
      GarageWallMaterial? garageWallMaterial,
      SmallPropertyRoofType? roofType,
      WaterRoofType? waterRoofType,
      num? roofLengthInMeters,
      num? roofFlatInMeters,
      @Default(false) areRecyclable,
      HeatingType? heatingType,
      num? powerInKiloWatts,
      num? heatingMachinesPcs,
      num? waterHeatersPcs,
      CarportOrGarage? carportOrGarage}) = _ThermalCenter;

  factory ThermalCenter.fromJson(Map<String, dynamic> json) =>
      _$ThermalCenterFromJson(json);

  /// Betoniperustus ja seinät

  /// Seinäpinta-ala (m2)
  num? get wallArea {
    if (onDisctrictOrDirectHeating == true) {
      return null;
    }
    return Utils.multiplyOrZero([
      Utils.sumOrNull([concreteLengthInMeters, concreteWidthInMeters]),
      2,
      wallHeightInMeters,
    ]);
  }

  /// Ulkoseinän pintamateriaali (tonnia)
  num? get outerWallSurfaceMaterial {
    switch (garageWallMaterial) {
      case GarageWallMaterial.board:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.board20x125)
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.brick:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.steelSheet:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          BuildingBoardsAndInsulationMaterialWeights
              .steelBoardCladding06mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.concrete:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case GarageWallMaterial.minerite:
        num? multiply = Utils.multiplyOrNull([
          wallArea,
          BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      default:
        return null;
    }
  }

  /// Materiaalimäärätaulukkoon luettava arvo, mineriitti- tai huopakate, sisältää asbestia
  num? get outerWallMineriteAsbestosTons {
    if (garageWallMaterial == GarageWallMaterial.minerite &&
        carportOrGarage?.coveringMaterialContainsAsbestos == true) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, puhdas käyttökelpoinen puu
  num? get cleanWoodTons {
    if (garageWallMaterial == GarageWallMaterial.board) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Sokkeli, betoni, tonnia
  num? get plinthConcreteTons => Utils.multiplyOrZero([
        Utils.sumOrNull([concreteLengthInMeters, concreteWidthInMeters]),
        2,
        plinthHeightInMeters,
        0.25,
        FoundationWeights.concreteKgPerCbm
      ]);

  /// Betonilaatta, tonnia
  num? get concreteTilesTons => Utils.multiplyOrNull([
        concreteLengthInMeters,
        concreteWidthInMeters,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);

  /// Betoniteräs
  num? get reinforcedConcrete {
    num? sum = Utils.sumOrNull([plinthConcreteTons, concreteTilesTons]);
    return sum != null
        ? sum /
            FoundationWeights.concreteKgPerCbm *
            FoundationWeights.concreteOrSteelBlockKgPerCbm
        : null;
  }

  /// Betoni (tonnia)
  num? get concreteTons {
    if (onDisctrictOrDirectHeating == true) {
      return null;
    }
    num? sum = Utils.sumOrNull([plinthConcreteTons, concreteTilesTons]);
    return sum != null ? sum / 1000 : null;
  }

  /// Betoni teräs (tonnia)
  num? get reinforcedConcreteTons {
    if (onDisctrictOrDirectHeating == true) {
      return null;
    }
    return reinforcedConcrete != null ? reinforcedConcrete! / 1000 : null;
  }

  /// Katto

  /// Pinta-ala
  num? get roofArea {
    if (onDisctrictOrDirectHeating == true) {
      return null;
    }
    switch (roofType) {
      case SmallPropertyRoofType.gableRoof:
        return Utils.multiplyOrZero([roofLengthInMeters, roofFlatInMeters, 2]);
      case SmallPropertyRoofType.flatRoof:
      case SmallPropertyRoofType.pentRoof:
        return Utils.multiplyOrNull([roofLengthInMeters, roofFlatInMeters]);
      default:
        return null;
    }
  }

  /// Puisen ristikkorakenteen paino (tonnia)
  num? get woodenRoofLatticeWeightTons {
    switch (roofType) {
      case SmallPropertyRoofType.gableRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          WoodenRoofStructuresWeights.gableRoofWithLattice800mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case SmallPropertyRoofType.flatRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          WoodenRoofStructuresWeights.flatRoofWithLattice800mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case SmallPropertyRoofType.pentRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          WoodenRoofStructuresWeights.cofferedCeilingWithLattice800mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      default:
        return null;
    }
  }

  /// Aluslaudoituksen paino (tonnia)
  num? get underBoardingWeightTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Vesikatteen paino (tonnia)
  num? get waterRoofWeightTons {
    switch (waterRoofType) {
      case WaterRoofType.roofingFelt:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.roofingFeltKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case WaterRoofType.metalRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.roofSheet06mmKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case WaterRoofType.mineriteRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      case WaterRoofType.tiledRoof:
        num? multiply = Utils.multiplyOrNull([
          roofArea,
          BuildingBoardsAndInsulationMaterialWeights.roofBrickKgPerSqm
        ]);
        return multiply != null ? multiply / 1000 : null;
      default:
        return null;
    }
  }

  /// Materiaalimäärään luettava arvo, seinä- ja kattotiilet
  num? get recyclableBrickTons {
    if (garageWallMaterial == GarageWallMaterial.brick &&
        carportOrGarage?.coveringMaterialContainsAsbestos == false) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätyskelvoton tiilijäte
  num? get nonRecyclableInnerWallBrickWasteTons {
    if (garageWallMaterial == GarageWallMaterial.brick &&
        carportOrGarage?.coveringMaterialContainsAsbestos == true) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, energiajäte, maalattupuu, kattohuopa ja aluskate
  num? get roofingFeltNoAsbestosWeightTons {
    if (waterRoofType == WaterRoofType.roofingFelt &&
        carportOrGarage?.coveringMaterialContainsAsbestos == false) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, Mineriitti- tai huopakate, sisältää asbestia huopa, asbestia
  num? get waterRoofFeltAsbestosTons {
    if (waterRoofType == WaterRoofType.roofingFelt &&
        carportOrGarage?.coveringMaterialContainsAsbestos == true) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, Mineriitti- tai huopakate, sisältää asbestia mineriitti, asbestia
  num? get waterRoofMineriteAsbestosTons {
    if (waterRoofType == WaterRoofType.mineriteRoof) {
      return waterRoofWeightTons;
    }
    return null;
  }

  /// Aluskate (tonnia)
  num? get underLaymentWeightTons {
    num? multiply = Utils.multiplyOrNull([
      roofArea,
      BuildingBoardsAndInsulationMaterialWeights.underlaymentKgPerSqm
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Lämpökattila/lämmönvaihdin

  /// Kattilan tai lämmönvaihtimen paino (tonnia)
  num? get boilerOrHeatExchangerWeightTons {
    switch (heatingType) {
      case HeatingType.pelletBoiler:
        return Utils.multiplyOrNull([
          (CentralHeatingWeights.woodChipBoilerKg / 1000),
          heatingMachinesPcs
        ]);
      case HeatingType.electricBoiler:
        return Utils.multiplyOrNull([
          (CentralHeatingWeights.electricBoilerKg / 1000),
          heatingMachinesPcs
        ]);
      case HeatingType.districtHeatExchanger:
        return CentralHeatingWeights.remoteHeatChangerKg / 1000;
      default:
        return null;
    }
  }

  /// Materiaalimäärätaulukkoon luettava arvo, Muu metalliromu, sähkökaapit, liedet, jääkaapit yms.
  num? get notRecyclablePelletBoilerTons {
    if (heatingType == HeatingType.pelletBoiler && areRecyclable == false) {
      return boilerOrHeatExchangerWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävä pellettikattila
  num? get recyclablePelletBoilerTons {
    if (heatingType == HeatingType.pelletBoiler && areRecyclable) {
      return boilerOrHeatExchangerWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, Muu metalliromu, sähkökaapit, liedet, jääkaapit yms.
  num? get notRecyclableElectricBoilerTons {
    if (heatingType == HeatingType.electricBoiler && areRecyclable == false) {
      return boilerOrHeatExchangerWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävä sähkökattila
  num? get recyclableElectricBoilerTons {
    if (heatingType == HeatingType.electricBoiler && areRecyclable) {
      return boilerOrHeatExchangerWeightTons;
    }

    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arco, sähkökattila (kpl)
  num? get recyclableHeatingMachinePieces {
    if (areRecyclable) {
      return heatingMachinesPcs;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, ruostumaton teräs, lämmönvaihdin
  num? get recyclableDistrictHeatExchangerTons {
    if (heatingType == HeatingType.districtHeatExchanger && areRecyclable) {
      return boilerOrHeatExchangerWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettrava arvo, kierrätettävä lämmönvaihdin (kpl)
  num? get recyclableDistrictHeatExchangerPieces {
    if (areRecyclable) {
      return heatingMachinesPcs;
    }
    return null;
  }

  /// Vesivaraajan paino (tonnia)
  num? get waterHeaterWeightTons {
    return Utils.multiplyOrNull(
        [(CentralHeatingWeights.waterHeaterKg / 1000), waterHeatersPcs]);
  }

  /// Materiaalimäärätaulukkoon luettava arvo, vesivaraajat
  num? get recyclableWaterHeaterTons {
    if (areRecyclable == true) {
      return waterHeaterWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, ruostumaton teräs
  num? get recyclableWaterHeaterStainlessSteelTons {
    if (areRecyclable == true) {
      return waterHeaterWeightTons;
    }
    return null;
  }

  /// Laskenta
  /// Lämpökeskus

  ///Betoniperustus ja seinät, betoni, puhdas
  num? get concreteClean {
    if (carportOrGarage?.buildingFoundationAndWallsContainAsbestosOrPcbPaints ==
        false) {
      return concreteTons;
    }
    return null;
  }

  /// Betoniperustus ja seinät, betoni, asbestia
  num? get concreteAsbestos {
    if (carportOrGarage?.buildingFoundationAndWallsContainAsbestosOrPcbPaints ==
        true) {
      return concreteTons;
    }
    return null;
  }

  /// Betoniteräs, puhdas
  num? get reinforcedConcreteClean => reinforcedConcreteTons;

  /// Lautaverhous, puhdas
  num? get boardCladding {
    if (garageWallMaterial == GarageWallMaterial.board) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Tiili, puhdas
  num? get brickWallMaterial {
    if (garageWallMaterial == GarageWallMaterial.brick &&
        CarportOrGarage()
                .buildingFoundationAndWallsContainAsbestosOrPcbPaints ==
            false) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Tiili, asbestia
  num? get brickWallMaterialAsbestos {
    if (garageWallMaterial == GarageWallMaterial.brick &&
        CarportOrGarage()
                .buildingFoundationAndWallsContainAsbestosOrPcbPaints ==
            true) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Teräslevy, puhdas
  num? get steelSheetCladding {
    if (garageWallMaterial == GarageWallMaterial.steelSheet) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Betoni, puhdas
  num? get concreteWallMaterial {
    if (garageWallMaterial == GarageWallMaterial.concrete) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Betoni, asbestia
  num? get concreteWallMaterialAsbestos {
    if (garageWallMaterial == GarageWallMaterial.concrete &&
        CarportOrGarage()
                .buildingFoundationAndWallsContainAsbestosOrPcbPaints ==
            true) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Mineriitti, asbestia
  num? get mineriteWallMaterialAsbestos {
    if (garageWallMaterial == GarageWallMaterial.minerite) {
      return outerWallSurfaceMaterial;
    }
    return null;
  }

  /// Lämpökeskukset, keskuslämmitysputket ja patterit

  /// Lämpökeskukset, kpl
  num? get boilersPcs => heatingMachinesPcs;

  /// Lämpökeskukset, kierrätettävät
  num? get boilersRecyclable {
    if (areRecyclable == true) {
      return heatingMachinesPcs;
    }
    return null;
  }

  /// Vesivaraajat, kierrätettävät
  num? get waterHeaterPcsRecyclable {
    if (areRecyclable == true) {
      return waterHeatersPcs;
    }
    return null;
  }
}
