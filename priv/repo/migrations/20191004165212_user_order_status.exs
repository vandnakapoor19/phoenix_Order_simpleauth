defmodule SimpleAuth.Repo.Migrations.UserOrderStatus do
  use Ecto.Migration

  def change do
    create table(:user_order_status)do
        add :user_id, references(:users, on_delete: :nothing)
        add :order_status_id, references(:order_status, on_delete: :nothing)
        add :name, :string
        add :contact, :integer
        add :email, :string
        add :address, :string
        add :state, :string
        add :city, :string
        add :zipcode, :integer

        timestamps()

      end
  end
end
