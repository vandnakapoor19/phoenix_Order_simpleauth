defmodule SimpleAuth.Repo.Migrations.OrderInsertedDate do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      modify :inserted_at, :timestamptz, default: fragment("NOW()")

      timestamps(type: :timestamptz)
      end
  end
end
