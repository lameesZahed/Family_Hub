abstract class GalleryState {}

class GalleryInitialState extends GalleryState {}
class GalleryLoadingState extends GalleryState {}
class GalleryLoadedState extends GalleryState {}
class GalleryErrorState extends GalleryState {
  final String message;
  GalleryErrorState(this.message);
}

class PhotoUploadingState extends GalleryState {}
class PhotoUploadSuccessState extends GalleryState {}
class PhotoUploadFailureState extends GalleryState {
  final String error;
  PhotoUploadFailureState(this.error);
}