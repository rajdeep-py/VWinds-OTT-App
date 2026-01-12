import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void setIndex(int i) => selectedIndex.value = i;

  // sample data for tiles
  final RxList<Map<String, String>> tiles = <Map<String, String>>[
    {
      'title': 'Mystery Tales',
      'subtitle': 'Audiobook',
      'image': 'assets/icons/deewana.jpg',
    },
    {
      'title': 'Ambient Beats',
      'subtitle': 'Music',
      'image': 'assets/icons/kishore.jpeg',
    },
    {
      'title': 'Short Stories',
      'subtitle': 'Podcast',
      'image': 'assets/icons/lata.jpeg',
    },
    {
      'title': 'Classical Hours',
      'subtitle': 'Album',
      'image': 'assets/icons/nfak.jpeg',
    },
  ].obs;
}
