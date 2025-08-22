gem "devise"
gem "activeadmin"
gem 'sassc'

after_bundle do
  generate "devise:install"
  generate "active_admin:install"

  rails_command "db:migrate"
  rails_command "db:seed"

  say "All done! You can now run `rails server` and visit /admin.", :green

  git :init
  git add: "."
  git commit: "-a -m 'Initial commit'"
end
