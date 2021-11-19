import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/data.dart';

class DataCubit extends Cubit<List<Employee>> {
  DataCubit() : super(data);

  void delete(id) {
    state.removeWhere((element) => element.id == id);
    return emit(state);
  }

  void submit(data) {
    state.add(data);
    return emit(state);
  }
}
