module Sinatra
  module PaginationHelper
    def paginate(resource)
      data = []
      PaginationRenderer.config! :total_pages => Paginator.num_of_pages, 
                                 :current_page => Paginator.current_page,
                                 :after_first_page => 3,
                                 :arround_current_page => 5
                    
      if PaginationRenderer.has_links?
        data << '<div class="pagination">'
        data << "<a href =\"/#{resource}/?page=#{PaginationRenderer.first_page}\">First</a>" if PaginationRenderer.has_first_page?
        data << "<a href =\"/#{resource}/?page=#{PaginationRenderer.previous_page}\">Previous</a>" if PaginationRenderer.has_previous_page?
        if PaginationRenderer.has_first_page_section?
          PaginationRenderer.first_page_section.each do |page|
            data << (PaginationRenderer.current_page == page ? "<span>#{page}</span>" : "<a href =\"/#{resource}/?page=#{page}\">#{page}</a>") 
          end
          data << "<span>. . .</span>"
        end
        PaginationRenderer.middle_section.each do |page|
          data << (PaginationRenderer.current_page == page ? "<span>#{page}</span>" : "<a href =\"/#{resource}/?page=#{page}\">#{page}</a>")
        end
        if PaginationRenderer.has_last_page_section? 
          data << "<span>. . .</span>"
          PaginationRenderer.last_page_section.each do |page|
            data << (PaginationRenderer.current_page == page ? "<span>#{page}</span>" : "<a href =\"/#{resource}/?page=#{page}\">#{page}</a>") 
          end
        end
        data << "<a href =\"/#{resource}/?page=#{PaginationRenderer.next_page}\">Next</a>" if PaginationRenderer.has_next_page?
        data << "<a href =\"/#{resource}/?page=#{PaginationRenderer.last_page}\">Last</a>" if PaginationRenderer.has_last_page?
        data << '</div>'
      end
      data.join(' ')
    end
  end
  
  # helpers PaginationHelper
end