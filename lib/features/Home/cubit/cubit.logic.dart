import 'package:assignment2/core/data_source/hive.dart';
import 'package:assignment2/features/Home/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HiveDataSource hiveDataSource = HiveDataSource();

  HomeCubit() : super(HomeGet(notes: [])) {
    getNotes();
  }

   void getNotes() {
    final notes = hiveDataSource.get();
    emit(HomeGet(notes: notes));
  }

  Future<void> saveNote(String newNote) async {
    final currentNotes = hiveDataSource.get();
    final updatedNotes = [...currentNotes, newNote];
    await hiveDataSource.save(updatedNotes);
    getNotes();
  }

  Future<void> deleteNote(int index) async {
    await hiveDataSource.deleteNote(index);
    getNotes();
  }
}