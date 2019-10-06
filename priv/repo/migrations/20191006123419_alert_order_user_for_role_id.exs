defmodule SimpleAuth.Repo.Migrations.AlertOrderUserForRoleId do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :users_role_id
    end
  end
end
