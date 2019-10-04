defmodule SimpleAuth.Repo.Migrations.Order do
  use Ecto.Migration

  def change do
    create table(:orders)do
        add :patient_name, :string
        add :patient_contact, :integer
        add :patient_email, :string
        add :patient_address, :string
        add :patient_state, :string
        add :patient_city, :string
        add :patient_zipcode, :integer
        add :created_id, references(:users, on_delete: :nothing)
        add :pickup_date, :date
        add :pickup_time, :time

        timestamps()

      end
  end
end
