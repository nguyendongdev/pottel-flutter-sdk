import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simType_provider.g.dart';

enum TypeOfSim {
  physical,
  eSim,
}

@riverpod
class SimType extends _$SimType {
  @override
  TypeOfSim build() => TypeOfSim.eSim;

  // change sim type
  void changeSimType(TypeOfSim simType) {
    state = simType;
  }
}

@riverpod
class SelectedPackage extends _$SelectedPackage {
  @override
  String build() => '';

  void changeSelectedPackage(String package) {
    state = package;
  }
}

@riverpod
class ChooseSimSearch extends _$ChooseSimSearch {
  @override
  String build() => '';

  void changeChooseSimSearch(String search) {
    state = search;
  }
}
