import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:granio_flutter/pages/home/home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController()
      : super(
          HomeState(
            status: HomeStatus.initial,
          ),
        );
}
