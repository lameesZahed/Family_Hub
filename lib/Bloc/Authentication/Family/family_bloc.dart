import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Services/Authentication/family_service.dart';
import 'family_event.dart';
import 'family_state.dart';

class FamilyBloc extends Bloc<FamilyEvent, FamilyState> {
  final FamilyService _familyService = FamilyService();

  FamilyBloc() : super(FamilyInitial()) {

    on<CreateFamilyEvent>((event, emit) async {
      emit(FamilyLoading());
      try {
        final result = await _familyService.createFamily(event.familyName);
        final newFamilyCode = result['familyCode']!;

        try {
          await _familyService.joinFamily(newFamilyCode, event.relationship);
          print("Successfully updated owner relationship to: ${event.relationship}");
        } catch (joinError) {
          print("Join update failed, continuing workflow: $joinError");
        }

        emit(FamilyCreated(
          familyName: result['familyName']!,
          familyCode: newFamilyCode,
        ));
      } catch (e) {
        emit(FamilyError('Could not create family. Please try again.'));
      }
    });

    on<JoinFamilyEvent>((event, emit) async {
      emit(FamilyLoading());
      try {
        await _familyService.joinFamily(event.familyCode, event.relationship);
        emit(FamilyJoined());
      } catch (e) {
        emit(FamilyError('Invalid family code. Please try again.'));
      }
    });  }
}