import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/address_model.dart';
import '../services/address_service.dart';

part 'address_provider.g.dart';

enum AddressMode { twoLevel, threeLevel }

@riverpod
class AddressModeState extends _$AddressModeState {
  @override
  AddressMode build() {
    return AddressMode.twoLevel;
  }

  void setMode(AddressMode mode) {
    state = mode;
  }
}

@riverpod
class AddressSelection extends _$AddressSelection {
  @override
  SelectedAddress build() {
    return const SelectedAddress();
  }

  void selectProvince(AddressModel province) {
    state = SelectedAddress(province: province);
  }

  void selectDistrict(AddressModel district) {
    state = state.copyWith(district: district, ward: null);
  }

  void selectWard(AddressModel ward) {
    state = state.copyWith(ward: ward);
  }

  void reset() {
    state = const SelectedAddress();
  }
}

@riverpod
class AddressStep extends _$AddressStep {
  @override
  int build() {
    return 0; // 0: Province, 1: District/Ward, 2: Ward (3-level only)
  }

  void setStep(int step) {
    state = step;
  }

  void nextStep() {
    final mode = ref.read(addressModeStateProvider);
    final maxStep = mode == AddressMode.twoLevel ? 1 : 2;
    if (state < maxStep) {
      state++;
    }
  }

  void previousStep() {
    if (state > 0) {
      state--;
    }
  }

  int getTotalSteps() {
    final mode = ref.read(addressModeStateProvider);
    return mode == AddressMode.twoLevel ? 2 : 3;
  }
}

@riverpod
Future<List<AddressModel>> provinces(ProvincesRef ref) async {
  final addressService = ref.watch(addressServiceProvider);
  final cities = await addressService.getCities();
  return cities
      .map((city) => AddressModel(
            id: city.id.toString(),
            name: city.name ?? '',
          ))
      .toList();
}

@riverpod
Future<List<AddressModel>> districts(DistrictsRef ref) async {
  final addressService = ref.watch(addressServiceProvider);
  final selectedProvince = ref.watch(addressSelectionProvider).province;

  if (selectedProvince == null) return [];

  final districts = await addressService.getDistricts();
  return districts
      .where((district) => district.cityId.toString() == selectedProvince.id)
      .map((district) => AddressModel(
            id: district.id.toString(),
            name: district.name ?? '',
            parentId: district.cityId.toString(),
            level: 1,
          ))
      .toList();
}

@riverpod
Future<List<AddressModel>> wards(WardsRef ref) async {
  final addressService = ref.watch(addressServiceProvider);
  final selectedDistrict = ref.watch(addressSelectionProvider).district;

  if (selectedDistrict == null) return [];

  final wards = await addressService.getWards();
  return wards
      .where((ward) => ward.districtId.toString() == selectedDistrict.id)
      .map((ward) => AddressModel(
            id: ward.id.toString(),
            name: ward.name ?? '',
            parentId: ward.districtId.toString(),
            level: 2,
          ))
      .toList();
}

@riverpod
Future<List<AddressModel>> newCities(NewCitiesRef ref) async {
  final addressService = ref.watch(addressServiceProvider);
  final cities = await addressService.getNewCities();
  return cities
      .map((city) => AddressModel(
            id: city.id.toString(),
            name: city.name ?? '',
          ))
      .toList();
}

@riverpod
Future<List<AddressModel>> newWards(NewWardsRef ref) async {
  final addressService = ref.watch(addressServiceProvider);
  final selectedProvince = ref.watch(addressSelectionProvider).province;

  if (selectedProvince == null) return [];

  final wards = await addressService.getNewWards();
  return wards
      .where((ward) => ward.cityId.toString() == selectedProvince.id)
      .map((ward) => AddressModel(
            id: ward.id.toString(),
            name: ward.name ?? '',
            parentId: ward.cityId.toString(),
            level: 1,
          ))
      .toList();
}
