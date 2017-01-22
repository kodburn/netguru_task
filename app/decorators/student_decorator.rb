class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes
    if notes.any?
      format('%.2f', notes.sum(:value).to_f / notes.length)
    else
      format('%.2f', 0)
    end
  end
end
