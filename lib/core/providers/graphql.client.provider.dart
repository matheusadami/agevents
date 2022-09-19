import 'package:agevents/core/constants/app.settings.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientProvider extends StatelessWidget {
  GraphQLClientProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  final GraphQLClient client = GraphQLClient(
    link: HttpLink(AppSettings.graphQLApiUrl),
    cache: GraphQLCache(),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(client),
      child: child,
    );
  }
}
