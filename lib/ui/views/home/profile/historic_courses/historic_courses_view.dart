import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'historic_courses_viewmodel.dart';

class HistoricCoursesView extends StackedView<HistoricCoursesViewModel> {
  const HistoricCoursesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoricCoursesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
