final class TooltipTexts {
  static final outerSheath = _OuterSheathTooltipTexts();
  static final partitionWallsDoorsAndWindows =
      _PartitionWallsDoorsAndWindowsTooltipTexts();
  static final hvacAndElectricalInstallations =
      _HvacAndElectricalInstallationTooltipTexts();
  static final wasteLawTable = _WasteLawTableTooltipTexts();
}

final class _PartitionWallsDoorsAndWindowsTooltipTexts {
  final interiorWallFramesAndSurfaceMaterials =
      _InteriorWallFramesAndSurfaceMaterialTooltipTexts();
  final windows = _WindowTooltipTexts();
  final fixedFurnitureTooltipTexts = _FixedFurnitureTooltipTexts();
}

final class _HvacAndElectricalInstallationTooltipTexts {
  final machineDetailedWeight =
      'Jos laitteen tarkka paino on tiedossa, voidaan se kirjata tähän. Muuten laskenta käyttää oletuspainoja.';

  final detailedWeightPerMeters =
      'Tähän voi antaa oman metripainon, jos on tarkempi tieto. Muuten laskenta käyttää oletuspainoja.';

  final detailedWeightPerSquareMeters =
      'Tähän voi antaa oman neliöpainon, jos on tarkempi tieto. Muuten laskenta käyttää oletuspainoja.';
}

final class _WasteLawTableTooltipTexts {
  final manualWasteLawEntry =
      'Tämän koodin mukaisia jätteitä ohjelma ei laske automaattisesti. Määrät pitää kirjata käsin.';
}

final class _InteriorWallFramesAndSurfaceMaterialTooltipTexts {
  final overallInnerWallLength =
      'Sisäseinien kokonaispituus sisältää kaikki huonetilat mukaan '
      'lukien aulat, WC, pukuhuone, pesutilat jne.';

  final teachingAndTreatmentSpaces =
      'Opetustiloilla tarkoitetaan koulujen luokkatiloja tai vastaavia tiloja.'
      ' Hoitotiloilla tarkoitetaan terveysasemien potilas- ja tutkimushuoneita, ei kuitenkaan sairaalatiloja.';

  final wallsWithWoodenFrame = 'Oletus 100x50 lankku 800mm välein.';
}

final class _WindowTooltipTexts {
  final defaultWindowOpeningSize = 'Oletus lasiaukon koko 1,5m2';
}

final class _FixedFurnitureTooltipTexts {
  final chipboardOrWoodenKitchenCabinets =
      'Laskentaoletuksena on ala ja yläkaapit kokonaismitta 600x1800 mm. Maalattu lastulevy.';

  final woodPanelClosets =
      'Laskennan oletuskoko on 600x1800 mm. Materiaali maalattu lastulevy.';
}

final class _OuterSheathTooltipTexts {
  final foundationAndFloors = _FoundationAndFloorsTooltipTexts();
  final floorStructures = _FloorStructuresTooltipTexts();
  final roof = _RoofTooltipTexts();
  final frame = _FrameTooltipTexts();

  final grossFloorArea =
      'Todellinen rakennuksen kerrosala rakennusselityksen tai piirrustusten mukainen '
      ' Jos tähän annetaan pinta-ala, käytetään laskennassa tätä tietoa. Jos arvo on nolla, käytetään'
      ' välipohjan keskimääräistä kerrosalaa sekä kerrosten määrää.';

  final volume =
      'Todellinen rakennuksen tilavuus piirrustusten tai rakennusselityksen mukaan.'
      ' Sisältää myös kellaritilat. Jos kerrosten määrä ilman kellaritiloja on merkitty arvolle 0,'
      ' lasketaan tilavuus muiden tietojen perusteella.';

  final averageArea =
      'Jos rakennuksen kerrospinta-ala on annettu, ei keskimääräistä pinta-alaa tarvitse ilmoittaa,'
      ' sillä se lasketaan todellisen pinta-alan perusteella jakamalla pinta-ala kerrosten määrällä.';

  final grossFloorAreaExcludingCellars =
      'Kokonaiskerrosala ei sisällä kellaritilojen pinta-alaa.';
}

final class _FoundationAndFloorsTooltipTexts {
  final foundationAndFloors =
      'Ohjelmassa on mahdollista arvioida useamman erilaisen perustusmallin purkumateriaalimäärät, '
      'jos rakennus on rakennettu useassa vaiheessa ja eri rakennusosien perustukset on tehty eri tekniikalla.'
      ' Jos taas koko kiinteistön perustus on samanlainen, valitaan vain yksi perustusmalli.';

  final bitumenCoating =
      'Jos vedeneristyksessä on käyetty betonissa bitumisivelyä, kirjautuu se purkumateriaalimäärä raportiin ongelmajätteenä.';
}

final class _FloorStructuresTooltipTexts {
  final teachingAndTreatmentSpaces =
      'Opetustiloilla tarkoitetaan koulujen luokkatiloja tai vastaavia tiloja.'
      ' Hoitotiloilla tarkoitetaan terveysasemien potilas- ja tutkimushuoneita, ei kuitenkaan sairaalatiloja.';
}

final class _RoofTooltipTexts {
  final area =
      'Jos katon todellinen pinta-ala on tiedossa, kirjataan se tähän.'
      ' Jos tietoa ei ole, voidaan käyttää laskennallista oletus pinta-alaa.';

  final areaDefault =
      'Kattopinta-alan oletusarvo on laskettu rakennuksen pohjapinta-alan perusteella'
      ' siten, että harja ja aumakaton korjauskerroinoletus on 25 %. Kertoimessa on huomioitu myös'
      ' räystäsylitykset. Tavanomaisen 1/3 kaltevuuden kulma on n. 18o mikä vastaa 20% kaltevuutta.';

  final ridgeOrGableRoofPortion =
      'Kattotyypin % osuutta muuttamalla korjataan'
      ' kattotyyppi pinta-ala vastaamaan todellista kattopinta-alaa jos se on tiedossa';

  final demolitionMaterialCount =
      'oletuksena on 80 mm ristikkojako, tämän perusteella'
      ' kattorungon paino on 20kg/m2';
}

final class _FrameTooltipTexts {
  final perimeter =
      'Ulkoseinien kehämitta, eli seinien yhteispituus'
      'Jos kehämittaa ei tiedetä, valitaan pikavalinnalla: käytä perusrtuksen kehämittaa.'
      ' Tällöin oletetaan, että ulkoseinien kehämitan on saman kuin perustuksen kehämitta.';

  final wallStructure =
      'Ulkoseinien sisäpuoli on samalla kantava verhoiltupintainen sisäseinä, esim. maalattu cybroc';
}
