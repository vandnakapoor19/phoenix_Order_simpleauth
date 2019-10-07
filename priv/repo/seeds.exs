# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SimpleAuth.Repo.insert!(%SimpleAuth.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SimpleAuth.Repo
alias SimpleAuth.Useradmin_params = %{
                name: "Admin User",
                 email: "admin@test.com",
                 password: "supersecret",
                 is_admin: true}

  unless Repo.get_by(User, email: admin_params[:email]) do
  %User{}
  |> User.registration_changeset(admin_params)
  |> Repo.insert!
end

alias SimpleAuth.Records

album_data = [
  %{
    artist: "The Beatles",
    title: "Abbey Road",
    year: "1969",
    summary: "Abbey Road is the eleventh album ..."
  },
  %{
    artist: "Led Zeppelin",
    title: "Untitled",
    year: "1971",
    summary: "English rock band Led Zeppelin's ..."
  },
  %{
    artist: "Miles Davis",
    title: "Kind Of Blue",
    year: "1959",
    summary: "Kind of Blue is a studio album by American jazz trumpeter ..."
  }
]

Enum.each(album_data, fn(data) ->
  Records.create_album!(data)
end)
