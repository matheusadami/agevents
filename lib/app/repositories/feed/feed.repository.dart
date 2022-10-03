import 'package:agevents/app/repositories/feed/interface.feed.repository.dart';
import 'package:agevents/app/services/graphql.client.service.dart';
import 'package:agevents/core/helpers/date.helper.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:provider/provider.dart';

class FeedRepository implements IFeedRepository {
  late GraphQLClientService graphQLService;

  FeedRepository() {
    graphQLService = NavigationService.context!.read<GraphQLClientService>();
  }

  @override
  Future<List<Map<String, dynamic>>> getEventsTodayFromUser(
    Map<String, dynamic> variables,
  ) async {
    final stringQuery = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.query,
      operationName: 'SearchEventsFromUser',
      paramsOperation: {
        r'$userId': 'ID!',
        r'$finalDate': 'String',
        r'$initialDate': 'String',
      },
      eventName: 'searchEventsFromUser',
      paramsEvent: {
        'userId': r'$userId',
        'searchEventsMobile': {
          'finalDate': r'$finalDate',
          'initialDate': r'$initialDate',
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

    variables['initialDate'] = DateHelper.getCurrentDateUSFormat();
    variables['finalDate'] = variables['initialDate'];

    final data = await graphQLService.query(stringQuery, variables);

    List<Map<String, dynamic>> events = [];
    if (data.containsKey('searchEventsFromUser')) {
      for (var map in data['searchEventsFromUser']) {
        events.add(Map<String, dynamic>.from(map));
      }
    }

    return events;
  }
}
