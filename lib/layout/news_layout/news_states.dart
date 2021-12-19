abstract class NewsStates {}
class InitialNewsState extends NewsStates{}
class ChangeBottomSheetScreenState extends NewsStates{}

class LoadingBusinessScreenState extends NewsStates{}
class BusinessGetDataSuccessState extends NewsStates{}
class BusinessGetDataErrorState extends NewsStates{
  final String error;
  BusinessGetDataErrorState(this.error);
}

class LoadingScienceScreenState extends NewsStates{}
class ScienceGetDataSuccessState extends NewsStates{}
class ScienceGetDataErrorState extends NewsStates{
  final String error;
  ScienceGetDataErrorState(this.error);
}

class LoadingSportScreenState extends NewsStates{}
class SportGetDataSuccessState extends NewsStates{}
class SportGetDataErrorState extends NewsStates{
  final String error;
  SportGetDataErrorState(this.error);
}

class LoadingSearchScreenState extends NewsStates{}
class SearchGetDataSuccessState extends NewsStates{}
class SearchGetDataErrorState extends NewsStates{
  final String error;
  SearchGetDataErrorState(this.error);
}


