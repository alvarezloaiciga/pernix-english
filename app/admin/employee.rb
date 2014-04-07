ActiveAdmin.register Employee do
  permit_params :email, :name, :total

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :last_charged_at
    actions
  end

  form do |f|
    f.inputs "Employee Details" do
      f.input :email
      f.input :name
      f.input :total
    end
    f.actions
  end
end
