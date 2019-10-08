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
alias SimpleAuth.User

admin_params =  %{
                name: "BetterRd",
                 email: "betterrd@test.com",
                 password: "123456",
                 is_admin: false,
                 address: "1275 Kinner Road",
                 state: "OH",
                 city: "Columbus",
                 zipcode: 43221,
                 user_role_id: 2}

  unless Repo.get_by(User, email: admin_params[:email]) do
  %User{}
  |> User.registration_changeset(admin_params)
  |> Repo.insert!
end


admin_params_two =  %{
name: "Same Day Delivery",
 email: "sameday@test.com",
 password: "123456",
 is_admin: false,
 address: "900 Trenton Lane",
  state: "NJ",
  city: "Trenton",
  zipcode: 08536,
  user_role_id: 3}

  unless Repo.get_by(User, email: admin_params_two[:email]) do
  %User{}
  |> User.registration_changeset(admin_params_two)
  |> Repo.insert!
end


admin_params_three =  %{
name: "RestRx",
 email: "restrx@test.com",
 password: "123456",
 is_admin: false,
 address: "123 Austin St",
  state: "Tx",
  city: "Austin",
  zipcode: 78702,
  user_role_id: 2}

  unless Repo.get_by(User, email: admin_params_three[:email]) do
  %User{}
  |> User.registration_changeset(admin_params_three)
  |> Repo.insert!
end



admin_params_four =  %{
name: "Drugs R Us",
 email: "drugsrus@test.com",
 password: "123456",
 is_admin: false,
 address: "4925 LA Ave",
  state: "CA",
  city: "Los Angeless",
  zipcode: 90056,
  user_role_id: 2}

  unless Repo.get_by(User, email: admin_params_four[:email]) do
  %User{}
  |> User.registration_changeset(admin_params_four)
  |> Repo.insert!
end

admin_params_four =  %{
name: "Previous Day Delivery",
 email: "previous@test.com",
 password: "123456",
 is_admin: false,
 address: "7433 LA Ct",
  state: "CA",
  city: "Los Angeless",
  zipcode: 90056,
  user_role_id: 3}

  unless Repo.get_by(User, email: admin_params_four[:email]) do
  %User{}
  |> User.registration_changeset(admin_params_four)
  |> Repo.insert!
end
