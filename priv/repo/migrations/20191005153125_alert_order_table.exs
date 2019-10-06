defmodule SimpleAuth.Repo.Migrations.AlertOrderTable do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      modify :inserted_at, :datetime, default: fragment("NOW()")
      end
  end
end
