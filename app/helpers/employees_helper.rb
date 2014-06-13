module EmployeesHelper
  def open_row_tag?(index)
    index % 4 == 0
  end

  def close_row_tag?(index)
    index % 4 == 3
  end
end
