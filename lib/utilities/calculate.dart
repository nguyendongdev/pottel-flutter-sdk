import 'package:skyfi_sdk/screens/sim_data_skyfi/models/choose_sim/result.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/provider/simType_provider.dart';

int priceSim(Result? chooseSim, {TypeOfSim simType = TypeOfSim.physical}) {
  if (chooseSim == null) {
    return 0;
  }
  return simType == TypeOfSim.physical
      ? (chooseSim.usimPrice ?? 0) +
          (chooseSim.networkPrice ?? 0) +
          (chooseSim.salePrice ?? 0)
      : (chooseSim.esimPrice ?? 0) +
          (chooseSim.networkPrice ?? 0) +
          (chooseSim.salePrice ?? 0);
}

int basePriceSim(Result? chooseSim, {TypeOfSim simType = TypeOfSim.physical}) {
  if (chooseSim == null) {
    return 0;
  }
  return simType == TypeOfSim.physical
      ? (chooseSim.usimPrice ?? 0) +
          (chooseSim.networkPrice ?? 0) +
          (chooseSim.basePrice ?? 0)
      : (chooseSim.esimPrice ?? 0) +
          (chooseSim.networkPrice ?? 0) +
          (chooseSim.basePrice ?? 0);
}
