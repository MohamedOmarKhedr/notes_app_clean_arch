import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return AddNoteBottomSheet();
          },);
        },
        child: const Icon(Icons.add),
      ),
      body: const HomeViewBody(),
    );
  }
}

