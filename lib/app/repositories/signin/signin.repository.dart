import 'package:agevents/app/repositories/signin/interface.signin.repository.dart';
import 'package:agevents/app/services/graphql.client.service.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:provider/provider.dart';

class SignInRepository implements ISignInRepository {
  late final GraphQLClientService graphQLService;

  SignInRepository() {
    graphQLService = NavigationService.context!.read<GraphQLClientService>();
  }

  @override
  Future<Map<String, dynamic>> signIn(Map<String, dynamic> variables) async {
    final stringQuery = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.query,
      operationName: 'Login',
      paramsOperation: {
        r'$email': 'String!',
        r'$password': 'String!',
      },
      eventName: 'login',
      paramsEvent: {
        'email': r'$email',
        'password': r'$password',
      },
      returnFields: ['userId', 'token'],
    );

    final data = await graphQLService.query(stringQuery, variables);

    return data['login'];
  }

  @override
  Future<Map<String, dynamic>> getUserById(
    Map<String, dynamic> variables,
  ) async {
    final stringQuery = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.query,
      operationName: 'GetUserById',
      paramsOperation: {
        r'$userId': 'ID!',
      },
      eventName: 'getUserById',
      paramsEvent: {
        'userId': r'$userId',
      },
      returnFields: ['_id', 'name', 'phone', 'email'],
    );

    final data = await graphQLService.query(stringQuery, variables);

    return data['getUserById'];
  }
}
