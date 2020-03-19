enum District {
  Flacq,
  GrandPort,
  Moka,
  Pamplemousses,
  PlainesWilhems,
  PortLouis,
  RiviereDuRempart,
  RiviereNoire,
  Savanne,
}

extension DistrictExtension on District {
  String get value {
    switch (this) {
      case District.Flacq:
        return 'Flacq';
      case District.GrandPort:
        return 'Grand Port';
      case District.Moka:
        return 'Moka';
      case District.Pamplemousses:
        return 'Pamplemousses';
      case District.PlainesWilhems:
        return 'Plaines Wilhems';
      case District.PortLouis:
        return 'Port Louis';
      case District.RiviereDuRempart:
        return 'Riviere du Rempart';
      case District.RiviereNoire:
        return 'Riviere Noire';
      case District.Savanne:
        return 'Savanne';
      default:
        return null;
    }
  }
}
