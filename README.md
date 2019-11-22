# 🌰🌲 SETRO Online Store 🌲🌰

This is an Online store that allows you to browse through a fixed database of tree seed products. It has Cart functionality that also shows you the quantity, prices, and total of your oder to be placed.


## Usage

After successfully logging in, you will be presented with a collections of Tree Seed species. You can click a button at the end of the page to show the next collection of products. Each product card shows the price and has an 'add to cart' button. The car component, accessible via the navigation bar at the top, will show all the products you have added to your cart including the quantity and price of each, and the total of the order. In the cart section you can change the status of the order to mark it as a completed order. 

## Technologies
### Front-End
- [React](https://reactjs.org/docs/getting-started.html)
- [React BootStrap](https://react-bootstrap.github.io/)

### Back-End
- [Ruby on Rails](https://rubyonrails.org)
- [PostgreSQL](https://www.postgresql.org)
- Auth using [JWT](https://jwt.io) and [bcrypt ](https://rubygems.org/gems/bcrypt/versions/3.1.12)

## Installation
First, I will begin with the Back end setup. 

### Setting up the Rails Back-end API:
1.make sure the database is created by running `rails db:create`
2. Start up the Rails Server `rails server`

### Launch [Front-end React App](https://github.com/ozkr8a/setro-frontend):
1. `npm start` runs the app in the development mode.
Open http://localhost:3000 to view it in the browser.
