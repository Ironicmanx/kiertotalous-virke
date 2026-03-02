abstract class WoodGlassPlasticsEvent {}

class WoodNotesChanged extends WoodGlassPlasticsEvent {
  String? value;
  WoodNotesChanged(this.value);
}

class GlassNotesChanged extends WoodGlassPlasticsEvent {
  String? value;
  GlassNotesChanged(this.value);
}

class PlasticNotesChanged extends WoodGlassPlasticsEvent {
  String? value;
  PlasticNotesChanged(this.value);
}

class OtherDangerousMaterialsNotesChanged extends WoodGlassPlasticsEvent {
  String? value;
  OtherDangerousMaterialsNotesChanged(this.value);
}
