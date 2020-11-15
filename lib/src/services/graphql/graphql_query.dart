part of 'index.dart';

extension GraphqlQuery on GraphqlService {
  Future meQuery() async {
    final result = await this
        .query(QueryOptions(documentNode: gql('{ me ${User.graphqlQuery} }')));
    return result.data['me'];
  }

  Future recommendableUsersQuery() async {
    final result = await this.query(QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        documentNode:
            gql('{ recommendableUsers ${SimpleUser.graphqlQuery} }')));
    return result.data['recommendableUsers'];
  }

  Future hobbiesQuery() async {
    final result = await this.query(
        QueryOptions(documentNode: gql('{ hobbies ${Hobby.graphqlQuery} }')));
    return result.data['hobbies'];
  }
}