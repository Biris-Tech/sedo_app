import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'historic_courses_viewmodel.dart';


class HistoricCoursesView extends StackedView<HistoricCoursesViewModel> {
  const HistoricCoursesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HistoricCoursesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  HistoricCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoricCoursesViewModel();
}
