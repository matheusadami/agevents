import 'package:agevents/core/helpers/custom.exception.dart';
import 'package:agevents/core/services/navigator.service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum TypeOperationGraphQL {
  query('query'),
  mutation('mutation');

  const TypeOperationGraphQL(this.name);

  final String name;
}

class GraphQLClientService {
  Future<Map<String, dynamic>> query(
    String query,
    Map<String, dynamic> variables,
  ) async {
    final graphQlClient = GraphQLProvider.of(NavigationService.context!).value;
    final result = await graphQlClient.query(
      QueryOptions(
        document: gql(query),
        variables: variables,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    await Future.doWhile(() => result.isLoading);

    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        throw CustomException(result.exception!.graphqlErrors.first.message);
      }

      throw CustomException(
        'Não foi possível estabelecer comunicação com o servidor',
      );
    }

    return result.data ?? {};
  }

  Future<Map<String, dynamic>> mutation(
    String mutation,
    Map<String, dynamic> variables,
  ) async {
    final graphQlClient = GraphQLProvider.of(NavigationService.context!).value;
    final result = await graphQlClient.mutate(
      MutationOptions(
        document: gql(mutation),
        variables: variables,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    await Future.doWhile(() => result.isLoading);

    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        throw CustomException(result.exception!.graphqlErrors.first.message);
      }

      throw CustomException(
        'Não foi possível estabelecer comunicação com o servidor',
      );
    }

    return result.data ?? {};
  }

  String buildQueryOperation({
    required TypeOperationGraphQL operationGraphQL,
    required String operationName,
    required Map<String, dynamic> paramsOperation,
    required String eventName,
    required Map<String, dynamic> paramsEvent,
    required List<String> returnFields,
  }) {
    final regExp = RegExp(r'[{}]');
    late String query;
    late String formatParamsEvent;
    late String formatParamsOperation;

    formatParamsOperation = paramsOperation.toString().replaceAll(regExp, '');

    formatParamsEvent = paramsEvent.toString().replaceFirst(regExp, '');
    formatParamsEvent = formatParamsEvent.replaceFirst(
      RegExp(r'[{}]'),
      '',
      formatParamsEvent.length - 1,
    );

    query = operationGraphQL.name;
    query += ' $operationName($formatParamsOperation) { ';
    query += ' $eventName($formatParamsEvent) { ';
    query += returnFields.join(' , ');
    query += ' } } ';

    return query;
  }
}
