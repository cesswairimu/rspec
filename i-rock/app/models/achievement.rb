class Achievement < ApplicationRecord
  validates :title, presence: true
  enum privacy: [:public_access, :private_access, :friends  ]

  def description_html
     Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end
end
