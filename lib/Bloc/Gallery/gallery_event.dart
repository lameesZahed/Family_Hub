import 'dart:io';

abstract class GalleryEvent {}

class FetchGalleryDataEvent extends GalleryEvent {}

class UploadPhotoEvent extends GalleryEvent {
  final File file;
  final String albumId;
  UploadPhotoEvent({required this.file, required this.albumId});
}