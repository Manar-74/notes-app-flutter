import 'package:hive/hive.dart';

class HiveDataSource {
  final Box myBox = Hive.box('notesBox');

  Future<void> save(List<String> note) async {
    await myBox.put('notesBox', note);
  }

  
List<String> get() {
    final data = myBox.get('notesBox');
    if (data == null) return [];            
    return List<String>.from(data);         
  }
  

 Future<void> deleteNote(int index) async {
  final currentNotes = get();
  currentNotes.removeAt(index);
  await save(currentNotes);
}
}