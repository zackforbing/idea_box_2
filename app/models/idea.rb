class Idea < ApplicationRecord

  enum quality: %w(swill plausible genius)

  def upvote
    if upper_enum_range?
      update_attributes(quality: quality_before_type_cast + 1)
    end
  end

  def downvote
    if lower_enum_range?
      update_attributes(quality: quality_before_type_cast - 1)
    end
  end

  private

    def upper_enum_range?
      return (quality_before_type_cast + 1) <= 2
    end

    def lower_enum_range?
      return (quality_before_type_cast - 1) >= 0
    end
end
