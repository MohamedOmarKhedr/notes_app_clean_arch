import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/constants_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstantsManager.kAppPadding,
      child: const Column(children: [
      SizedBox(height: 20),
       CustomAppBar(),
       ]),
    );
  }
}
