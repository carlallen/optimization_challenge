# optimization_challenge

Your APM software has detected a lot of repeated database queries throughout your application that look like:  
* `SELECT role FROM role_memberships WHERE user_id = ?`
* `SELECT code FROM permissions where user_id = ?`

You tracked down a specific case in `UsersController#index`.  
Propose some solutions and discuss benefits/tradeoffs.
