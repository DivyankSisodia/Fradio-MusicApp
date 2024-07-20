import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/home_data.dart';
import '../repository/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

final homeDataProvider = FutureProvider<HomeData>((ref) async {
  final homeRepo = ref.watch(homeRepositoryProvider);
  return homeRepo.fetchHomeData();
});