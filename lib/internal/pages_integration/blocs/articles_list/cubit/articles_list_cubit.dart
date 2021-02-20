import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'articles_list_state.dart';

class ArticlesListCubit extends Cubit<ArticlesListState> {
  ArticlesListCubit() : super(ArticlesListInitial());
}
