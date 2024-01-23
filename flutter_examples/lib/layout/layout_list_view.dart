import 'package:flutter/material.dart';

class LayoutListView extends StatelessWidget {
  const LayoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        tile('The Castro Theater', '429 Castro St', Icons.theaters),
        tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        tile('Roxie Theater', '3117 16th St', Icons.theaters),
        tile('United Artists Stonestown', '501 Buckingham', Icons.theaters),
      ],
    );
  }
}

ListTile tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}
