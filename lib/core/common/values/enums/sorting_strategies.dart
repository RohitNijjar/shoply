enum SortingStrategies {
  categoryNameAsc('Category Name A - Z'),
  categortNameDesc('Category Name Z - A'),
  categoryPriceAsc('Category Price Low - High'),
  categoryPriceDesc('Category Price High - Low');

  final String value;
  const SortingStrategies(this.value);
}
