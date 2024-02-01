import 'package:flutter/material.dart';
import 'package:flutter_examples/http/album_model.dart';
import 'package:flutter_examples/http/app_services.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  List<AlbumModel> albums = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    albums = await AppServices().getAlbum() ?? [];
    print(albums);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return Row(
          children: [
            Text(
              '${album.id}',
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                '${album.title}',
                style: const TextStyle(fontSize: 24, color: Colors.black),
                
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 14),
    );
  }
}
