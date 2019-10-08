defmodule SimpleAuth.Repo.Migrations.Order do
  use Ecto.Migration

  def change do
    create table(:orders)do
        add :patient_name, :string
        add :order_number, :string
        add :patient_contact, :string
        add :patient_email, :string
        add :patient_address, :string
        add :patient_state, :string
        add :patient_city, :string
        add :patient_zipcode, :integer
        add :user_id, references(:users, on_delete: :nothing)
        add :pickup_date, :date
        add :pickup_time, :time
        add :order_status , :integer
        add :courier_id, references(:users, on_delete: :nothing)

        timestamps()
      end
      create index(:posts, [:user_id])
  end
end
