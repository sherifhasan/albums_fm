import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../data/models/artist_search_response.dart';
import '../../actions/search/search_fetch_action.dart';
import '../../models/app_state.dart';
import '../widgets/empty_view.dart';
import '../widgets/loading_view.dart';
import 'widgets/search_populated_view.dart';

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
            appBar: AppBar(
              title: const Text('Search'),
              centerTitle: true,
            ),
            body: Flex(direction: Axis.vertical, children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: searchController,
                        autofocus: true,
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
    } else if (state.artistSearchResponse !=
        const ArtistSearchResponse.empty()) {
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
