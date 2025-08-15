import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/core/utils/service_locator.dart';
import 'package:notes_app_clean_arch/core/utils/text_style_manager.dart';
import 'package:notes_app_clean_arch/core/widgets/custom_alert_dialog.dart';
import 'package:notes_app_clean_arch/features/home/data/models/note_model.dart';
import 'package:notes_app_clean_arch/features/home/domain/use_cases/update_note_use_case.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/delete_note_cubit/delete_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/update_note_cubit/update_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  final NoteModel note;
  const NoteItem({super.key, required this.note});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  late DeleteNoteCubit deleteNoteCubit;
  @override
  void initState() {
    deleteNoteCubit = BlocProvider.of<DeleteNoteCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<EditNoteView>(
            builder: (context) => BlocProvider(
              create: (context) =>
                  UpdateNoteCubit(getit.get<UpdateNoteUseCase>()),
              child: EditNoteView(note: widget.note),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          color: Color(widget.note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    widget.note.title,
                    style: TextStyleManager.noteTitleTextStyle,
                  ),
                ),
                textColor: Colors.black,
                iconColor: Colors.black,
                subtitle: Text(
                  widget.note.note,
                  style: TextStyleManager.noteContentTitleTextStyle,
                ),
                trailing: IconButton(
                  onPressed: () {
                    CustomAlertDialog.show(
                      context: context,
                      title: 'Confirmation',
                      message: 'Do you want to delete this note?',
                      onConfirm: () {
                        deleteNoteCubit.deleteNote(note: widget.note);
                        if (context.mounted) {
                          context.read<GetNotesCubit>().removeNoteLocally(
                            widget.note,
                          );
                        }
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  widget.note.date,
                  style: TextStyleManager.noteHistoryTitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
