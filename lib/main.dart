import 'package:appsfactory_task/core/middlewares/database_middleware.dart';
import 'package:appsfactory_task/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'core/middlewares/album_details_middleware.dart';
import 'core/middlewares/search_middleware.dart';
import 'core/middlewares/top_albums_middleware.dart';
import 'core/models/app_state.dart';
import 'core/reducers/app_reducer.dart';
import 'data/repositories/app_repository.dart';
import 'data/services/navigation/navigation_service.dart';
import 'database_setup.dart';
import 'locator_setup.dart';
import 'shared/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDatabase();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final navigationService = locator<NavigationService>();

  MyApp({
    Key? key,
  })  : store = Store<AppState>(
          appReducer,
          initialState: AppState.idle(),
          middleware: [
            createStoreTopAlbumsMiddleware(locator<AppRepository>()),
            createStoreSearchMiddleware(locator<AppRepository>()),
            createStoreAlbumDetailsMiddleware(locator<AppRepository>()),
            createStoreDatabaseMiddleware()
          ],
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'AlbumsFm',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        initialRoute: RoutePaths.initialRoute,
        routes: AppRouter.routes(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
