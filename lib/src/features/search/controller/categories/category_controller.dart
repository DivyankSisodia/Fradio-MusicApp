import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/category/get_categories_repository.dart';

final categoryModelProvider = Provider<GetCategories>((ref) {
  return GetCategories();
});

final categoriesProvider = FutureProvider.autoDispose((ref) async {
  final res = ref.watch(categoryModelProvider);
  return res.getCategories();
});