import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splach_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeRoute = '/homeView';
  static const kBookDetailsRoute = '/bookDetailsView';
  static const kSearchRoute = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchRoute,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsRoute,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
