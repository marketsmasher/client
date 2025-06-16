interface class KlineResultDto {
  final String symbol;
  final String category;
  final List list;

  const KlineResultDto({
    required this.symbol,
    required this.category,
    required this.list,
  });

  factory KlineResultDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'symbol': String symbol,
        'category': String category,
        'list': List list,
      } =>
        KlineResultDto(symbol: symbol, category: category, list: list),
      _ => throw const FormatException('Failed to get klines data'),
    };
  }
}
