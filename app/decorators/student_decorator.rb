class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
  end
end
