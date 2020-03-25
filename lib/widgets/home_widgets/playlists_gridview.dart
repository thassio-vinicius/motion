import 'package:flutter/material.dart';
import 'package:motion/widgets/home_widgets/playlist_item.dart';

class PlaylistsGridview extends StatefulWidget {
  @override
  _PlaylistsGridviewState createState() => _PlaylistsGridviewState();
}

class _PlaylistsGridviewState extends State<PlaylistsGridview> {
  List<PlaylistItem> _gridList = [
    PlaylistItem(
      image: 'assets/images/billie.png',
      title: 'Radio Motion',
      containsDescription: true,
      description:
          'Reveja as músicas que você gosta e que te ajudam a desestressar',
      duration: '40-50 min',
    ),
    PlaylistItem(
      image: 'assets/images/america.png',
      title: 'ouça e altere a playlist do jeito que preferir',
      containsDescription: false,
      duration: '20-30 min',
    ),
    PlaylistItem(
      image: 'assets/images/steviewonder.png',
      title: 'Relaxing R&B',
      containsDescription: false,
      duration: '25-35 min',
    ),
    PlaylistItem(
      image: 'assets/images/scorpions.png',
      title: 'Hard Rock',
      containsDescription: true,
      description:
          "Está em clima de Rock'n'Roll? Confira a playlist que preparamos!",
      duration: '50-60 min',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _gridList.length,
        padding: EdgeInsets.all(12),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
        itemBuilder: (context, index) => _gridList[index]);
  }
}
