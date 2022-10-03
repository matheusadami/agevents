import 'package:agevents/app/repositories/forgot-password/interface.forgot.password.repository.dart';
import 'package:agevents/app/services/graphql.client.service.dart';
import 'package:agevents/app/services/local.storage.service.dart';
import 'package:agevents/core/services/navigation.service.dart';
import 'package:provider/provider.dart';

class FotgotPasswordRepository implements IForgotPasswordRepository {
  late final GraphQLClientService graphQLService;

  FotgotPasswordRepository() {
    graphQLService = NavigationService.context!.read<GraphQLClientService>();
  }

  @override
  String getCurrentRecoveryCode(String key) {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return shared.getString(key: key);
  }

  @override
  String getCurrentUserId(String key) {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return shared.getString(key: key);
  }

  @override
  Future<Map<String, dynamic>> getUserByPhone(
    Map<String, String> variables,
  ) async {
    final stringQuery = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.query,
      operationName: 'GetUserByPhone',
      paramsOperation: {
        r'$phone': 'String!',
      },
      eventName: 'getUserByPhone',
      paramsEvent: {
        'phone': r'$phone',
      },
      returnFields: ['_id', 'name', 'email', 'phone'],
    );

    final data = await graphQLService.query(stringQuery, variables);

    return data['getUserByPhone'] ?? {};
  }

  @override
  Future<bool> saveRecoveryCode(String key, String value) async {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return await shared.saveString(
      key: key,
      value: value,
    );
  }

  @override
  Future<bool> saveUserId(String key, String value) async {
    final shared = NavigationService.context!.read<LocalStorageService>();
    return await shared.saveString(
      key: key,
      value: value,
    );
  }

  @override
  Future<bool> changePassword(String newPassword, String userId) async {
    final stringMutation = graphQLService.buildQueryOperation(
      operationGraphQL: TypeOperationGraphQL.mutation,
      operationName: 'ChangeUserPassword',
      paramsOperation: {
        r'$userId': 'ID!',
        r'$password': 'String!',
      },
      eventName: 'changeUserPassword',
      paramsEvent: {
        'userId': r'$userId',
        'password': r'$password',
      },
      returnFields: ['isChanged'],
    );

    final variables = {'userId': userId, 'password': newPassword};
    await graphQLService.mutation(stringMutation, variables);

    return true;
  }
}
