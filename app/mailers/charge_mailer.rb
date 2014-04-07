class ChargeMailer < ActionMailer::Base
  default from: "The Police <police@pernix.cr>"

  def employee_charged(employee, ammount)
    @employee = employee
    @ammount = ammount
    mail(to: @employee.email, subject: 'Shut the fuck up!')
  end

end
