import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewer extends StatelessWidget {
  final List<ExactAssetImage> photos;

  const ImageViewer({Key key, this.photos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Container(
        child: PhotoViewGallery.builder(
          itemCount: photos.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: photos[index],
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          loadingBuilder:
              (BuildContext context, ImageChunkEvent imageChunkEvent) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
