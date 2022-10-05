abstract class IEventsRepository {
  Future<List<Map<String, dynamic>>> searchEventsFromUser(
    Map<String, dynamic> variables,
  );
  Future<Map<String, dynamic>> getEventById(Map<String, dynamic> variables);
  Future<bool> changeStatus(Map<String, dynamic> variables);
  Future<bool> removeEvent(Map<String, dynamic> variables);
  Future<bool> create(Map<String, dynamic> variables);
  Future<bool> update(Map<String, dynamic> variables);
}
