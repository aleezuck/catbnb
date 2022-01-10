# CatBnB

CatBnB is an AirBnB app for cats. 🐱 Built with Ruby on Rails.

### Setup

##### 1. Clone repository
```
git clone git@github.com:aleezuck/catbnb.git
cd catbnb
```
##### 2. Create .env file
CatBnb uses Cloudinary for user image uploads and Mapbox to display cat flats on a map. Both require an API key to be added to a ```.env``` file in root folder of app.
```
CLOUDINARY_URL=...
MAPBOX_API_KEY=...
```
##### 3. Setup app and database
```
bundle install
yarn install
rails db:create db:migrate
```
##### 4. (optional) Seed database
A seed file has been provided with some demo data.
```
rails db:seed
```
In this case, the app can be previewed by logging in with email ```demo@demo.com``` and password ```demo123456```
