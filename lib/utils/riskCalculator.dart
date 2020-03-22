import '../models/symptom.dart';

enum Risk {
    severe,
    atRisk,
    mild
}

Risk calculateRisk(List<Symptom> symptoms, int age, bool hasPreexistingConditions) {
    int sum;
    symptoms.reduce((sum, e) => sum + e.riskFactor);

    if ((age > 60) && (hasPreexistingConditions)) {
        return Risk.severe;
    }

    int severeSum = 20;
    int atRiskSum  = 15;

    if (age > 60) {
        severeSum = 10;
        atRisk = 0;
    } else if (hasPreexistingConditions) {
        severeSum = 15;
        atRiskSum = 9;
    }

    if (sum > severeSum) {
        return Risk.severe;
    } else if (sum > atRiskSum) {
        return Risk.atRisk;
    } else {
        return Risk.mild;
    }
}
