import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_clean_arch/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  late AddNoteCubit addNoteCubit;
  
  @override
  void initState() {
    addNoteCubit = BlocProvider.of<AddNoteCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: addNoteCubit.colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  addNoteCubit.fetchCurrentIndex(index);
                },
                child: ColorItem(
                  color: addNoteCubit.colors[index],
                  isActive: addNoteCubit.currentIndex == index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
