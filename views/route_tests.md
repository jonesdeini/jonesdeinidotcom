#Route Tests

##Why test routes?
Route tests in Rails may seem like a waste of time.

I recently implemented full test coverage of our routes file for the Rails app I work on at my day job.
Our app started with Rails 2.3 and when we upgraded to Rails 3.1 we used the [Rails Legacy Mapper](https://github.com/pixeltrix/rails_legacy_mapper) gem to avoid completely rewriting our routes file.

I have been tasked with getting us from Rails 3.1 to Rails 4.1, which means I will now need to rewrite the routes file.

I found them a lot more useful than simply asserting the same routes still exist.

##Routes to nowhere
The Rails app I work on is 5 years old and has thousands of routes. There are several reasons why unused routes may exist.

For example:

* People not realizing the routes that may have been created for them by Rails
* Features that have had the majority of code removed but the routes still remain.

For whatever reason, these routes probably exist in your application and they are simply cruft. Route tests can eliminate both the above causes.

##Duplicate/Ambiguous routes
Rails 2.3 did not require you to specify an HTTP verb for routes. It is very easy to have routes that duplicate or overwrite each other.

These routes are more of an annoyance than a major problem. The biggest issue they may cause is to make your routes file further order dependent.

Route tests will help point out when routes are conflicting as the test will hit the first match in the routes file.

When you have conflicting routes you will only be able to use `assert_generates`, instead of `assert_routing`, and not test the route both ways.
