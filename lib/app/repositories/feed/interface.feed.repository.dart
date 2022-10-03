abstract class IFeedRepository {
  Future<List<Map<String, dynamic>>> getEventsTodayFromUser(
    Map<String, dynamic> variables,
  );
}
