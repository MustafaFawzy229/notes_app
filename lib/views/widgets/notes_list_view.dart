import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        List<NoteModel> notesList =
            BlocProvider.of<GetNotesCubit>(context).notes ?? [];

        return notesList.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.faceSadTear,
                      color: kPrimaryColor,
                      size: 80,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'No Notes Yet, Please Add One.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: NoteItem(
                          note: notesList[index],
                        ),
                      );
                    }),
              );
      },
    );
  }
}
