import 'package:agevents/app/repositories/events/interface.events.repository.dart';
import 'package:agevents/app/services/graphql.client.service.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:provider/provider.dart';

class EventsRepository implements IEventsRepository {
  late GraphQLClientService graphQLService;

  EventsRepository() {
    graphQLService = NavigationService.context!.read<GraphQLClientService>();
  }

  @override
  Future<Map<String, dynamic>> searchEventsFromUser(
    Map<String, dynamic> variables,
  ) async {
    final stringQuery = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.query,
      operationName: 'GetEventsFromUser',
      paramsOperation: {
        r'$userId': 'ID!',
      },
      eventName: 'getEventsFromUser',
      paramsEvent: {
        'userId': r'$userId',
      },
      returnFields: [
        '_id',
        'title',
        'description',
        'date',
        'category',
        'priority',
      ],
    );

    return await graphQLService.send(stringQuery, variables);
  }
}
