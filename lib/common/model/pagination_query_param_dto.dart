class PaginationQueryParam {
  int? page;
  bool? descending;
  bool isToRefresh;
  String? filters;
  int? fromloader;
  String? sortBy;
  int? rowsPerPage;

  PaginationQueryParam({
    this.page,
    this.descending = true,
    this.isToRefresh = true,
    this.filters,
    this.sortBy = 'created_at',
    this.fromloader = 1,
    this.rowsPerPage = 10,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['descending'] = descending;
    data['isToRefresh'] = isToRefresh;
    data['filters'] = filters;
    data['fromloader'] = fromloader;
    data['sortBy'] = sortBy;
    data['rowsPerPage'] = rowsPerPage;
    data['descending'] = descending;

    return data;
  }

  PaginationQueryParam copyWith({
    int? page,
    String? createdAt,
    bool? descending,
    bool? isToRefresh,
    String? filters,
    int? fromloader,
    String? sortBy,
    int? rowsPerPage,
  }) {
    return PaginationQueryParam(
      page: page ?? this.page,
      descending: descending ?? this.descending,
      isToRefresh: isToRefresh ?? this.isToRefresh,
      filters: filters ?? this.filters,
      fromloader: fromloader ?? this.fromloader,
      sortBy: sortBy ?? this.sortBy,
      rowsPerPage: rowsPerPage ?? this.rowsPerPage,
    );
  }
}
