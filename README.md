# dd_csv

This program is written to parse a provided CSV file and programmatically return its contents in the form of mock web calls.

In order to run the program and view the resulting content, clone the repository. In your terminal, navigate to the cloned repo, and run the following:
`ruby code.rb`

The terminal will display the resulting mock web calls.

-----------

The program works by parsing the provided CSV file, assigning the parsed contents to corresponding variables, and using those variables to initialize `Site` and `Person` objects.
E.G. data related to a `site` (as outlined in the csv) is parsed and assigned to `country`, `site_number`, `facility_name`, `address`, `city`, `state`, and `zip` variables.

For all sites and people in the csv file, a check is performed (using `site_number` and `id_number`, respectively) to determine whether or not an instance of the corresponding class has already been created for that particular site or person.

-----------

If a `Person` object is created, and then appears again in the csv file with a _different_ prescribed role, that additional role is added to the original `Person` object using the `add_role` method.