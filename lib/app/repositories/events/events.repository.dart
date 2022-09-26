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

    List<Map<String, dynamic>> events = [];
    if (data.containsKey('searchEventsFromUser')) {
      for (var map in data['searchEventsFromUser']) {
        events.add(Map<String, dynamic>.from(map));
      }
    }

    return events;
  }

  @override
  Future<bool> changeStatus(Map<String, dynamic> variables) async {
    final stringMutation = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.mutation,
      operationName: 'ChangeStatusEvent',
      paramsOperation: {
        r'$eventId': 'ID!',
        r'$status': 'Int!',
      },
      eventName: 'changeStatusEvent',
      paramsEvent: {
        'eventId': r'$eventId',
        'status': r'$status',
      },
      returnFields: [
        'isChanged',
      ],
    );

    await graphQLService.send(stringMutation, variables);

    return true;
  }

  @override
  Future<bool> removeEvent(Map<String, dynamic> variables) async {
    final stringMutation = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.mutation,
      operationName: 'RemoveEvent',
      paramsOperation: {
        r'$eventId': 'ID!',
      },
      eventName: 'removeEvent',
      paramsEvent: {
        'eventId': r'$eventId',
      },
      returnFields: [
        'isRemoved',
      ],
    );

    await graphQLService.send(stringMutation, variables);

    return true;
  }
}
