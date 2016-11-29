# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlExample.Repo.insert!(%GraphqlExample.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GraphqlExample.User
alias GraphqlExample.Post
alias GraphqlExample.Repo

Repo.insert!(%User{name: "Andrés", email: "andres@loopa.io"})
Repo.insert!(%User{name: "Alejandro", email: "info@loopa.io"})

for _ <- 1..10 do
  Repo.insert(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
