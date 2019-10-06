defmodule SimpleAuth.Repo.Migrations.UserOrder do
  use Ecto.Migration

  def change do
    create table(:user_orders)do
     add :order_id, references(:orders, on_delete: :nothing)
     add :user_id, references(:users, on_delete: :nothing)

     timestamps()

   end
  end
end
