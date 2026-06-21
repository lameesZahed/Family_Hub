// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'gallery_event.dart';
// import 'gallery_state.dart';
// import '../../Services/Gallery/gallery_api_service.dart';
//
// class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
//   final GalleryApiService _apiService = GalleryApiService();
//
//   GalleryBloc() : super(GalleryInitialState()) {
//
//     on<FetchGalleryDataEvent>((event, emit) async {
//       emit(GalleryLoadingState());
//       try {
//         await _apiService.fetchAllGalleryData();
//         emit(GalleryLoadedState());
//       } catch (e) {
//         emit(GalleryErrorState("Failed to load gallery"));
//       }
//     });
//
//     on<UploadPhotoEvent>((event, emit) async {
//       emit(PhotoUploadingState());
//       try {
//         bool success = await _apiService.uploadPhoto(event.file, event.albumId);
//         if (success) {
//           emit(PhotoUploadSuccessState());
//           add(FetchGalleryDataEvent());
//         } else {
//           emit(PhotoUploadFailureState("Upload failed"));
//         }
//       } catch (e) {
//         emit(PhotoUploadFailureState(e.toString()));
//       }
//     });
//   }
// }