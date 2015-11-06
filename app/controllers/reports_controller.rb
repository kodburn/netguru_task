class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
end
