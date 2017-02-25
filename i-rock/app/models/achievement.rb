class Achievement < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :user, presence: true
  validate :identical_titles
  enum privacy: [:public_access, :private_access, :friends  ]

  def description_html
     Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
  end

  private
  def identical_titles
    existing_achievement = Achievement.find_by(title: title)
    if existing_achievement && existing_achievement.user == user
      errors.add(title, "You cant have it same title for achievement twice")
    end
  end
end
