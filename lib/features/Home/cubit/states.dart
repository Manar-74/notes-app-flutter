abstract class HomeState {}

class HomeInitial extends HomeState {
  final List<String> notes;

  HomeInitial({required this.notes});
}
class HomeSave extends HomeState {}
class HomeDelete extends HomeState {}
class HomeGet extends HomeState {
final List<String> notes;
  HomeGet({required this.notes});

}