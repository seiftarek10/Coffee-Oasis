class FireBasePathParam {
  final String parentCollection;
  final String parentDocId;
  final String? subCollection;
  final String? subDocId;

  FireBasePathParam(
      {required this.parentCollection,
      required this.parentDocId,
      this.subCollection,
      this.subDocId});
}
