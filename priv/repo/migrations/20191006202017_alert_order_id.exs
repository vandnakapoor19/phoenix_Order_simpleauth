defmodule SimpleAuth.Repo.Migrations.AlertOrderId do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      remove :user_id
    end
  end
end
