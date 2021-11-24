import 'package:flutter_bloc/flutter_bloc.dart';

class TagBlocCubit extends Cubit<TagBlocState>{
  TagBlocCubit(TagBlocState initialState) : super(initialState);

  void add(String name){
    List<String> tags = state.tags;
    tags.add(name);
    emit(TagBlocState(tags: tags));
  }

  void remove(String name){
    List<String> tags = state.tags;
    tags.removeWhere((element) => element == name);
    emit(TagBlocState(tags: tags));
  }
}

class TagBlocState{
  final List<String> tags;
  TagBlocState({this.tags = const []});
}