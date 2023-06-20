part of 'get_notes_cubit.dart';

@immutable
abstract class GetNotesState {}

class GetNotesInitial extends GetNotesState {}

class GetNotesSuccess extends GetNotesState {
  final List<NoteModel> notes;

  GetNotesSuccess(this.notes);
}

class GetNotesFailure extends GetNotesState {
  final String errMessage;

  GetNotesFailure(this.errMessage);
}
