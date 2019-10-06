defmodule SimpleAuth.Repo.Migrations.AlertOrderTableRemoveField do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      remove :created_id
      add :courier_id ,:integer
      add :order_status , :integer

    end
  end
end
