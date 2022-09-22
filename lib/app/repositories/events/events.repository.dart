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
  Future<List<Map<String, dynamic>>> searchEventsFromUser(
    Map<String, dynamic> variables,
  ) async {
    final stringQuery = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.query,
      operationName: 'SearchEventsFromUser',
      paramsOperation: {
        r'$userId': 'ID!',
        r'$title': 'String',
        r'$finalDate': 'String',
        r'$initialDate': 'String',
        r'$category': 'Int',
        r'$priority': 'Int',
      },
      eventName: 'searchEventsFromUser',
      paramsEvent: {
        'userId': r'$userId',
        'searchEventsMobile': {
          'title': r'$title',
          'finalDate': r'$finalDate',
          'initialDate': r'$initialDate',
          'category': r'$category',
          'priority': r'$priority',
        },
      },
      returnFields: [
        '_id',
        'title',
        'description',
        'date',
        'status',
        'category',
        'priority',
      ],
    );

    final data = await graphQLService.send(stringQuery, variables);
    return data['searchEventsFromUser'];
  }
}
