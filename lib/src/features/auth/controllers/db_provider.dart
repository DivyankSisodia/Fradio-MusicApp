import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/user_info.dart';

final dbProvider = Provider((ref) {
  return DataBaseMethods;
});