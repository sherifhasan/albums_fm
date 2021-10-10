import 'package:appsfactory_task/core/actions/search/search_fetch_action.dart';
import 'package:appsfactory_task/core/models/app_state.dart';
import 'package:appsfactory_task/core/screens/search/widgets/search_populated_view.dart';
import 'package:appsfactory_task/core/screens/widgets/loading_view.dart';
import 'package:appsfactory_task/data/models/artist_search_response.dart';
import 'package:appsfactory_task/data/models/artist_top_albums_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../widgets/empty_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _SearchScreenViewModel>(
      converter: (store) {
        return _SearchScreenViewModel(
          state: store.state,
          startSearch: (term) => store.dispatch(SearchFetchAction(term)),
        );
      },
      builder: (BuildContext context, _SearchScreenViewModel vm) {
        return SafeArea(
          child: Scaffold(
            body: Flex(direction: Axis.vertical, children: <Widget>[
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          labelText: 'Search artist...',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black54,
                              width: 2.0,
                            ),
                          )),
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => vm.startSearch(searchController.text),
                      icon: const Icon(Icons.search,
                          color: Colors.black, size: 28))
                ],
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _buildVisible(vm.state),
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  Widget _buildVisible(AppState state) {
    if (state.isLoading) {
      return const LoadingView();
    } else if (state.artistSearchResponse ==
        const ArtistSearchResponse.empty()) {
      return const EmptyView();
    } else if (state.artistTopAlbums != const ArtistTopAlbums.empty()) {
      return SearchPopulatedView(
          state.artistSearchResponse.artistMatches.artistsList);
    }
    throw ArgumentError('No view for state: $state');
  }
}

class _SearchScreenViewModel {
  final AppState state;
  final void Function(String term) startSearch;

  _SearchScreenViewModel({required this.state, required this.startSearch});
}
