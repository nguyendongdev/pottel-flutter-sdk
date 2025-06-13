import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/package_model_detail/package_model_detail.dart';
import '../repository/package_detail_repository.dart';

final packageDetailRepositoryProvider =
    Provider<PackageDetailRepository>((ref) {
  return PackageDetailRepository();
});

final packageDetailProvider =
    FutureProvider.family<PackageModelDetail, int>((ref, packageId) async {
  final repository = ref.read(packageDetailRepositoryProvider);
  return repository.getPackageDetail(packageId);
});
