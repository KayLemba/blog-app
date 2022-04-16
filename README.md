# Blog App

>  Blog website
![screenshot]

A simple blog app built using the Ruby on Rails framework.

## Project requirements

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/sneak_peek.md)

### Phase 1 - setup and controllers

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/Setup_Controllers_project.md)

### Phase 2 - controllers specs

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/controller_specs_project.md)

### Phase 3 - creating data model

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/creating_data_model_project.md)

### Phase 4 - processing data in models

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/Processing_data_model_project.md)

### Phase 5 - views

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/Views_project.md)

### Phase 6 - add forms

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/forms_project.md)

### Phase 7 - validations, model specs, and n+1 problems

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/blog_app_validations_model_spec_n+1.md)

### Phase 8 - add devise

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/blog_app_devise.md)

### Phase 9 - add authorization rules

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/blog_app_add_authorization.md)

### Phase 10 - integration specs for views

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/projects/Integration_specs_project.md)

### Phase 11 - add API endpoints

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/blog_app_api_endpoints.md)

### Phase 12 - API documentation

The project requirements can be viewed [here](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/blog_app_api_documentation.md)

## Built With

- Ruby on Rails
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Development Database

```sh
# Create user
sudo -u postgres createuser blog -s
# Create the database
rake db:create
# Create database Migration
rails db:migrate
```

### Install

```sh
bundle install
```

### Run

```sh
rails s
```

### Test

```sh
rspec
```

### API integration rswag

run: `rake rswag:specs:swaggerize`

## Author

👤 **Kalolo Chola Lemba**
- GitHub: [@KayLemba ](https://github.com/KayLemba)
- Twitter: [@King-Kaylo1 ](https://twitter.com/King_Kaylo1) 
- LinkedIn: [@kalolo-lemba](https://www.linkedin.com/in/https://www.linkedin.com/in/kalolo-lemba)

👤 **Yuriy Chamkoriyski**

- GitHub: [@Hombre2014](https://github.com/Hombre2014)
- Twitter: [@Chamkoriyski](https://twitter.com/Chamkoriyski)
- LinkedIn: [axebit](https://linkedin.com/in/axebit)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## License

[MIT](./LICENSE)
