defmodule SimpleAuth.Repo.Migrations.UserRole do
  use Ecto.Migration

  def change do
    create table(:user_role)do
    add :title, :string
    add :status, :boolean, default: false, null: false

    timestamps()
    end
  end
end
