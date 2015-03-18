module ApplicationHelper
  def will_paginate(options = {})
    page = options[:page]
    prev_page = page.to_i
    next_page = page.to_i
    
    if page.to_i > 1
      prev_page -= 1
    else
      prev_page = nil
    end
    next_page += 1
    
    links = []
    link1 = url_for(page: prev_page) if prev_page
    link2 = url_for(page: next_page)
    links = [link1, link2]
  end
  
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
  
  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
