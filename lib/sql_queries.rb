def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
  "SELECT projects.title, SUM(pledges.amount) AS total_pledges
  FROM projects
  JOIN pledges ON pledges.project_id = projects.id
  GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount) AS total_pledges
  FROM users
  JOIN pledges ON pledges.user_id = users.id
  GROUP BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, (SUM(pledges.amount)-projects.funding_goal) AS amount_left
  FROM projects
  JOIN pledges ON pledges.project_id = projects.id
  GROUP BY projects.title HAVING amount_left >= 0;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
  "SELECT users.name, SUM(pledges.amount) AS total_pledges
  FROM users
  JOIN pledges ON pledges.user_id = users.id
  GROUP BY users.name
  ORDER BY SUM(pledges.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount
  FROM projects
  JOIN pledges ON pledges.project_id = projects.id
  WHERE projects.category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, SUM(pledges.amount)
  FROM projects
  JOIN pledges ON pledges.project_id = projects.id
  WHERE projects.category = 'books';"
end
