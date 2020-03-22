enum Risk { severe, atRisk, mild }

extension RiskExtension on Risk {
  String get value {
    switch (this) {
      case Risk.severe:
        return 'Severe';
      case Risk.atRisk:
        return 'At Risk';
      case Risk.mild:
        return 'Mild';
      default:
        return null;
    }
  }
}
