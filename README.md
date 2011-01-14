reject_if
=========

A sample application to illustrate bug #6227 about reject_if apparently not being honoured.

How to reproduce
----------------

1. Go to /users/new and create a new user. You'll notice that here, if you leave the contact field blank, it will be rejected.
2. Now, suppose you've created /user/1, go do /user/1/edit and clear the contact field.
3. Submit. You'll notice that the contact field is left untouched.

Added some rspec tests
----------------------

    $ rspec spec
    .F                                                                                                                                           
    
    Failures:
    
      1) User when updated should reject blank contact information
         Failure/Error: lambda do
           count should not have changed, but did change from 0 to 1
         # ./spec/models/user_spec.rb:14
    
    Finished in 0.15251 seconds
    2 examples, 1 failure