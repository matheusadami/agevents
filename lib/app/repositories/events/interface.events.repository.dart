abstract class IEventsRepository {
  Future<List<Map<String, dynamic>>> searchEventsFromUser(
    Map<String, dynamic> variables,
  );
  Future<bool> changeStatus(Map<String, dynamic> variables);
  Future<bool> removeEvent(Map<String, dynamic> variables);
}
