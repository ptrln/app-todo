# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ned = User.create!(name: "Ned Ruggeri")
jon = User.create!(name: "Jonathan Tamboer")
peter = User.create!(name: "Peter Lin")
nick = User.create!(name: "Nick Hong")

staff = Team.create!(name: "App Academy Staff")
student = Team.create!(name: "App Academy Students")

TeamMembership.create!(team_id: staff.id, member_id: ned.id)
TeamMembership.create!(team_id: staff.id, member_id: jon.id)
TeamMembership.create!(team_id: student.id, member_id: peter.id)
TeamMembership.create!(team_id: student.id, member_id: nick.id)

cat = Project.create!(title: "Cat Academy",
  desc: "App Academy for cats", team_id: staff.id)
todo = Project.create!(title: "Todo App", team_id: student.id)

Item.create!(title: "Obtain cats", project_id: cat.id)
Item.create!(title: "Train cats", desc: "9 week curriculum", project_id: cat.id)
Item.create!(title: "Profit", desc: "Like cash cats", project_id: cat.id)

Item.create!(title: "Phase I: Project/Item", project_id: todo.id, desc: %Q{
  * A `Project` has many `Item`s todo.
  * Write a form for `Project` and for `Item`s.
      * A `Project` should have a title and a text description of its purpose.
      * An `Item` should have a title, description, whether it was completed.
  * The `Project` show page should list the `Item`s.
  * The `Item` show page should contain the `details` of the `Item`.
      * Select the `Project` from a select tag.
  * Add links from the `Item` back to the `Project`.
})
Item.create!(title: "Phase II: Team/Project", project_id: todo.id, desc: %Q{
  * Each `Project` belongs to one `Team`.
  * The `Team` show page should list the several `Project`s.
  * Select the `Team` from a select tag.
  * Add links from the `Project` back to the `Team`.
})
Item.create!(title: "Phase III: User", project_id: todo.id, desc: %Q{
  * A `User` may belong to many `Team`s; a `Team` will have many `User`s.
  * You'll need a `TeamMembership` model.
  * Use check boxes to associate `User` and `Team`.
  * Your `User` show page should list the `Team`s the `User` is a member of.
  * The `Team` show page should list the members.
})
Item.create!(title: "Phase IV: Nested routes", project_id: todo.id, desc: %Q{
  ### Phase IVa: Nested `new` route

  Suppose we want to add a new `Project` for a `Team`. We could go to the
  `Project` form page, select the `Team` from the drop down, and then fill out
  the form. However, if we're already on the `Team`'s show page, we would like
  to simply click a link that will take us to the `Project` form, pre-selecting
  the `Team` in the form.

  One way to do this is to add a nested route:

  ```ruby
  resources :teams do
    resources :projects, :only => [:new]
  end
  ```

  Requests to `teams/123/projects/new` will hit `ProjectsController#new`, but
  with `params[:team_id]` set to `123`. Use this to create a `Project` with the
  `team_id` attribute already set.

  Your old `/projects/new` route should also still work (both routes will hit
  the same controller action); it just won't do any default `Team` selection,
  of course.

  ### Phase IVb: Nested `index` routes

  Your `Project` show page lists all the `Item`s. This is fine, but if your
  `Project` were to accumulate more data (maybe it has a long description, an
  image, administrators, watchers, etc), you may not want to list all the
  `Item`s on the show page.

  To anticipate having more functionality in `Project`, we want to learn how to
  break the associated `Item`s out to their own page:
  `projects/:project_id/items`. This page can list the items in detail.

  Nest an items resource within your projects resource. You only need the index
  route. The `ItemsController#index` action should pull out the `project_id`
  and only list the `Item`s for this `Project`.

  The top-level items resource doesn't need an `index` method; it probably
  doesn't make sense to list all the items for all the projects.
})
Item.create!(title: "Discussion: nested routes", project_id: todo.id, desc: %Q{
  It is typical to restrict nested routes to only `new` and `index` options.
  The instance routes (the instance routes: `show`, `edit`, `update`, `delete`
  are best accessed through the top-level resource). That's because it's more
  convenient to `GET /items/123` than `GET /projects/456/items/123`; the
  project id is redundant anyway if you have the item id.

  As we've seen, `new` and `index` can be valuable nested routes; these are
  collection methods, they don't include an item id.

  You won't often need the `create` action (the last collection method) in your
  nested resource. `POST /projects/456/items` is likely to be redundant, since
  the project id will typically be embedded in the items parameters posted.

  Finally, note that if you must create an item for a project, you may remove
  the `new` and `index` resources. **Remove them from the top level items
  resource**.
})