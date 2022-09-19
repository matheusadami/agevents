import 'package:agevents/app/repositories/signup/interface.signup.repository.dart';
import 'package:agevents/app/services/graphql.client.service.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:provider/provider.dart';

class SignUpRepository implements ISignUpRepository {
  late final GraphQLClientService graphQLService;

  SignUpRepository() {
    graphQLService = NavigationService.context!.read<GraphQLClientService>();
  }

  @override
  Future<void> create(Map<String, dynamic> variables) async {
    final stringMutation = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.mutation,
      operationName: 'CreateUser',
      paramsOperation: {
        r'$name': 'String!',
        r'$phone': 'String!',
        r'$email': 'String!',
        r'$password': 'String!',
      },
      eventName: 'createUser',
      paramsEvent: {
        'userInput': {
          'name': r'$name',
          'phone': r'$phone',
          'email': r'$email',
          'password': r'$password'
        },
      },
      returnFields: ['_id', 'name', 'phone', 'email'],
    );

    await graphQLService.send(stringMutation, variables);
  }
}
