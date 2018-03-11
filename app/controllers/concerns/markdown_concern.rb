module MarkdownConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_renderer, only: %i[show edit new index call_for_talks archive]
  end

  def set_renderer
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new({link_attributes: {target: '_blank'}}), autolink: true, tables: true, hard_wrap: true)
  end
end