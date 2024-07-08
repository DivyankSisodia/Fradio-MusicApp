import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/home_repository.dart';

final artistProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

final fetchHomeDataProvider = FutureProvider<Map<String,dynamic>>((ref) async {
  final data = ref.watch(artistProvider);
  return data.fetchHomeData();
});