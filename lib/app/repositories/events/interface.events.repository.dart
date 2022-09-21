abstract class IEventsRepository {
  Future<Map<String, dynamic>> searchEventsFromUser(
    Map<String, dynamic> variables,
  );
}
