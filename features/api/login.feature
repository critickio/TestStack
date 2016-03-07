Feature:           User login
                   As a user
                   I want to login to upgrad

@auth_api @smoke_api @central
Scenario Outline:  login for a users with different credentials
                   Given params are <user_type> username and <pass_type> password
                   When  <type> user request for login
                   Then  login responds with <success> ,<status_code> ,<header> and list of keys                   
                   |userDetails     |
                   |username        |
                   |email           |
                   |firstname       |
                   |lastname        |
                   |phoneNumber     |
                   |roles           |
                   |referralCode    |
                   |name            |

Examples:          validate on types of request data
                   | type          | user_type     | pass_type | success | status_code | header      |
                   | "existing"    | "true"        | "true"    | "true"  | "200"       | "Auth-Token"|
                   | "existing"    | "true"        | "false"   | "false" | "200"       | ""          |
                   | "existing"    | "false"       | "true"    | "false" | "200"       | ""          |
                   | "existing"    | "false"       | "false"   | "false" | "200"       | ""          |


Scenario:         login for a user and store auth_token
                  Given  <type> user request for login
