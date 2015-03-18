module Paginater
  def paginate(options = {})
    per_page = options[:per_page]
    page = options[:page]
    self.limit(per_page).offset((page.to_i - 1)*per_page)
  end
end