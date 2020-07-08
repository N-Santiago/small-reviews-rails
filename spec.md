Specs:

X Using Ruby on Rails for the project
X Include at least one has_many relationship 
X Include at least one belongs_to relationship 
X Include at least two has_many through relationships 
X Include at least one many-to-many relationship
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) 
X Include reasonable validations for simple model objects
 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
X Include signup
X Include login
X Include logout
X Include third party signup/login 
 Include nested resource show or index (URL e.g. users/2/recipes)
 Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
X Include form display of validation errors (form URL e.g. /recipes/new)
 
 Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate

Models:

 Reviews
 - belongs_to :user
 - belongs_to :category
 - has_many :users, through :comments
 - title
 - content

 Users
 - has_many :reviews
 - has_many :comments
 - has_many :commented_posts, through: :comments 
 - has_many :categories, through: :reviews
 - username 
 - email
 - password_digest
 - rank :default => "Small Rookie" #use pundit for the user ranks 
 - admin :default => false 

 Comments 
 - belongs_to :user
 - belongs_to :review
 - content 

 Categories
 - has_many :reviews
 - has_many :users, through: :reviews 
 - name