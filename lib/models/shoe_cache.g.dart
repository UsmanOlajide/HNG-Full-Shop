// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_cache.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoeCacheCollection on Isar {
  IsarCollection<ShoeCache> get shoeCaches => this.collection();
}

const ShoeCacheSchema = CollectionSchema(
  name: r'ShoeCache',
  id: -60291603709013405,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.stringList,
    ),
    r'discountPrice': PropertySchema(
      id: 1,
      name: r'discountPrice',
      type: IsarType.string,
    ),
    r'formattedPrice': PropertySchema(
      id: 2,
      name: r'formattedPrice',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'photoUrls': PropertySchema(
      id: 5,
      name: r'photoUrls',
      type: IsarType.stringList,
    ),
    r'price': PropertySchema(
      id: 6,
      name: r'price',
      type: IsarType.doubleList,
    ),
    r'quantity': PropertySchema(
      id: 7,
      name: r'quantity',
      type: IsarType.double,
    )
  },
  estimateSize: _shoeCacheEstimateSize,
  serialize: _shoeCacheSerialize,
  deserialize: _shoeCacheDeserialize,
  deserializeProp: _shoeCacheDeserializeProp,
  idName: r'cacheId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _shoeCacheGetId,
  getLinks: _shoeCacheGetLinks,
  attach: _shoeCacheAttach,
  version: '3.1.0+1',
);

int _shoeCacheEstimateSize(
  ShoeCache object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  {
    for (var i = 0; i < object.category.length; i++) {
      final value = object.category[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.discountPrice.length * 3;
  bytesCount += 3 + object.formattedPrice.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.photoUrls.length * 3;
  {
    for (var i = 0; i < object.photoUrls.length; i++) {
      final value = object.photoUrls[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.price.length * 8;
  return bytesCount;
}

void _shoeCacheSerialize(
  ShoeCache object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.category);
  writer.writeString(offsets[1], object.discountPrice);
  writer.writeString(offsets[2], object.formattedPrice);
  writer.writeString(offsets[3], object.id);
  writer.writeString(offsets[4], object.name);
  writer.writeStringList(offsets[5], object.photoUrls);
  writer.writeDoubleList(offsets[6], object.price);
  writer.writeDouble(offsets[7], object.quantity);
}

ShoeCache _shoeCacheDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoeCache(
    category: reader.readStringList(offsets[0]) ?? const [],
    id: reader.readStringOrNull(offsets[3]) ?? '',
    name: reader.readStringOrNull(offsets[4]) ?? '',
    photoUrls: reader.readStringList(offsets[5]) ?? const [],
    price: reader.readDoubleList(offsets[6]) ?? const [],
    quantity: reader.readDoubleOrNull(offsets[7]) ?? 1,
  );
  object.cacheId = id;
  return object;
}

P _shoeCacheDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? const []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readStringList(offset) ?? const []) as P;
    case 6:
      return (reader.readDoubleList(offset) ?? const []) as P;
    case 7:
      return (reader.readDoubleOrNull(offset) ?? 1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shoeCacheGetId(ShoeCache object) {
  return object.cacheId;
}

List<IsarLinkBase<dynamic>> _shoeCacheGetLinks(ShoeCache object) {
  return [];
}

void _shoeCacheAttach(IsarCollection<dynamic> col, Id id, ShoeCache object) {
  object.cacheId = id;
}

extension ShoeCacheQueryWhereSort
    on QueryBuilder<ShoeCache, ShoeCache, QWhere> {
  QueryBuilder<ShoeCache, ShoeCache, QAfterWhere> anyCacheId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoeCacheQueryWhere
    on QueryBuilder<ShoeCache, ShoeCache, QWhereClause> {
  QueryBuilder<ShoeCache, ShoeCache, QAfterWhereClause> cacheIdEqualTo(
      Id cacheId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: cacheId,
        upper: cacheId,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterWhereClause> cacheIdNotEqualTo(
      Id cacheId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: cacheId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: cacheId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: cacheId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: cacheId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterWhereClause> cacheIdGreaterThan(
      Id cacheId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: cacheId, includeLower: include),
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterWhereClause> cacheIdLessThan(
      Id cacheId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: cacheId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterWhereClause> cacheIdBetween(
    Id lowerCacheId,
    Id upperCacheId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerCacheId,
        includeLower: includeLower,
        upper: upperCacheId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShoeCacheQueryFilter
    on QueryBuilder<ShoeCache, ShoeCache, QFilterCondition> {
  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> cacheIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheId',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> cacheIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheId',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> cacheIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheId',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> cacheIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      categoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      discountPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      formattedPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> photoUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      photoUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      priceElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      priceElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'price',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'price',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'price',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'price',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition>
      priceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'price',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> priceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'price',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ShoeCacheQueryObject
    on QueryBuilder<ShoeCache, ShoeCache, QFilterCondition> {}

extension ShoeCacheQueryLinks
    on QueryBuilder<ShoeCache, ShoeCache, QFilterCondition> {}

extension ShoeCacheQuerySortBy on QueryBuilder<ShoeCache, ShoeCache, QSortBy> {
  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByDiscountPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByDiscountPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByFormattedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByFormattedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }
}

extension ShoeCacheQuerySortThenBy
    on QueryBuilder<ShoeCache, ShoeCache, QSortThenBy> {
  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByCacheId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheId', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByCacheIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheId', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByDiscountPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByDiscountPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByFormattedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPrice', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByFormattedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedPrice', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }
}

extension ShoeCacheQueryWhereDistinct
    on QueryBuilder<ShoeCache, ShoeCache, QDistinct> {
  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByDiscountPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByFormattedPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByPhotoUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoUrls');
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ShoeCache, ShoeCache, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }
}

extension ShoeCacheQueryProperty
    on QueryBuilder<ShoeCache, ShoeCache, QQueryProperty> {
  QueryBuilder<ShoeCache, int, QQueryOperations> cacheIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheId');
    });
  }

  QueryBuilder<ShoeCache, List<String>, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ShoeCache, String, QQueryOperations> discountPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountPrice');
    });
  }

  QueryBuilder<ShoeCache, String, QQueryOperations> formattedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedPrice');
    });
  }

  QueryBuilder<ShoeCache, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShoeCache, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ShoeCache, List<String>, QQueryOperations> photoUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoUrls');
    });
  }

  QueryBuilder<ShoeCache, List<double>, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ShoeCache, double, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }
}
