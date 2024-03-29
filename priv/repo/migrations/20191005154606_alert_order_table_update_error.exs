defmodule SimpleAuth.Repo.Migrations.AlertOrderTableUpdateError do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      modify :updated_at, :datetime, default: fragment("NOW()")
      end
  end
end
