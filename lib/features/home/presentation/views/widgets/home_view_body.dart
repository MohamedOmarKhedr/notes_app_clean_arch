import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/core/utils/strings_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/notes_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstantsManager.kAppPadding,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomAppBar(
            title: StringsManager.appName,
            icon: Icons.search,
            onPressed: () {},
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
