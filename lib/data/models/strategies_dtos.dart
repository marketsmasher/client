interface class StrategyDto {
  final String id;
  final String name;
  final String baseCoin;
  final String quoteCoin;
  final String symbol;
  final String publicName;
  final String description;

  const StrategyDto({
    required this.id,
    required this.name,
    required this.baseCoin,
    required this.quoteCoin,
    required this.symbol,
    required this.publicName,
    required this.description,
  });

  factory StrategyDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'name': String name,
      'baseCoin': String baseCoin,
      'quoteCoin': String quoteCoin,
      'symbol': String symbol,
      'publicName': String publicName,
      'description': String description,
      } =>
          StrategyDto(
            id: id,
            name: name,
            baseCoin: baseCoin,
            quoteCoin: quoteCoin,
            symbol: symbol,
            publicName: publicName,
            description: description,
          ),
      _ => throw const FormatException('Failed to parse strategy.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'baseCoin': baseCoin,
      'quoteCoin': quoteCoin,
      'symbol': symbol,
      'publicName': publicName,
      'description': description,
    };
  }
}

