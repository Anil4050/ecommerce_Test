class ListData {
  final int productID;
  final String productName;
  final String productDesc;

  ListData(
      {required this.productID,
      required this.productDesc,
      required this.productName});
}

class SubList {
  late final int productID;
  late final String productName;
  late final String productDesc;
}
