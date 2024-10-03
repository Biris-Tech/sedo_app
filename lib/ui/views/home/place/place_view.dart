import 'place_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class PlaceView extends StackedView<PlaceViewModel> {
  const PlaceView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PlaceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rechercher un restaurant'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Entrez le nom du restaurant',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    viewModel.fetchRestaurants(
                        ''); // You may want to use a more specific query here
                  },
                ),
              ),
              onChanged: (query) {
                viewModel.fetchSuggestions(query);
              },
            ),
            const SizedBox(height: 16.0),
            if (viewModel.suggestions.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = viewModel.suggestions[index];
                    return ListTile(
                      title: Text(suggestion.name),
                      onTap: () {
                        // Perform search based on the selected suggestion
                        viewModel.fetchRestaurants(suggestion.name);
                      },
                    );
                  },
                ),
              ),
            if (viewModel.nearbyRestaurants.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.nearbyRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = viewModel.nearbyRestaurants[index];
                    return ListTile(
                      title: Text(restaurant.name),
                      subtitle: Text(restaurant.address),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  PlaceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlaceViewModel();
}
