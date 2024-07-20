import 'package:hive_flutter/hive_flutter.dart';

import 'src/features/home/model/popular_albums_model.dart';
import 'src/features/home/model/popular_artists_model.dart';
import 'src/features/home/model/popular_radio_model.dart';

void hiveAdaptors() async {
  Hive.registerAdapter(PopularAlbumModelAdapter());
  Hive.registerAdapter(PopularArtistsModelAdapter());
  Hive.registerAdapter(PopularRadioModelAdapter());
}
