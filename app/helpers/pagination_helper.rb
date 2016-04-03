module PaginationHelper

  def pagination_dict(object)
    {
      currentPage: object.current_page,
      nextPage: object.next_page,
      prevPage: object.prev_page,
      totalPages: object.total_pages,
      totalCount: object.total_count
    }
  end

end