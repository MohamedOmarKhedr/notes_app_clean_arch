import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/color_list_view.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_button.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, note;
  late AddNoteCubit addNoteCubit;
  late GetNotesCubit getNotesCubit;
  @override
  void initState() {
    addNoteCubit = BlocProvider.of<AddNoteCubit>(context);
    getNotesCubit = BlocProvider.of<GetNotesCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 12),
          CustomTextField(
            hintText: 'Content Note',
            minLines: 5,
            onSaved: (value) {
              note = value;
            },
          ),
          SizedBox(height: 12),
          ColorListView(),
          SizedBox(height: 15),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var dateFormat = DateFormat(
                      'dd-MM-yyyy',
                    ).format(DateTime.now());

                    var noteModel = NoteModel(
                      title: title ?? '',
                      note: note ?? '',
                      date: dateFormat.toString(),
                      color: addNoteCubit.currentColor.toARGB32(),
                      id: DateTime.now().microsecondsSinceEpoch,
                    );
                    addNoteCubit.addNote(noteModel: noteModel);
                    GetNotesCubit getNotesCubit = BlocProvider.of<GetNotesCubit>(context);
                    getNotesCubit.addNoteLocally(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}


