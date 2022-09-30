enum ProductSizeEnum {
  small('small', 'S'),
  medium('medium', 'M'),
  large('large', 'L');

  const ProductSizeEnum(this.value, this.sign);

  final String value;
  final String sign;

  String get lowerCasedSign => sign.toLowerCase();
}
/*
abstract class TestT {
  void test();

}
enum Test implements TestT {
  hello

}
*/

class ProductSize {
  static final sizes = [
    ProductSize(ProductSizeEnum.small),
    ProductSize(ProductSizeEnum.medium),
    ProductSize(ProductSizeEnum.large),
  ];
  final ProductSizeEnum value;

  factory ProductSize(ProductSizeEnum input) {
    return ProductSize._(
      (input),
    );
  }

  x() {
    ProductSizeEnum.large.lowerCasedSign;
  }

  const ProductSize._(this.value);
}
