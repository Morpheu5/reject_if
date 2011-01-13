reject_if
=========

A sample application to illustrate bug #6227 about reject_if apparently not being honoured.

How to reproduce
----------------

1. Go to /users/new and create a new user. You'll notice that here, if you leave the contact field blank, it will be rejected.
2. Now, suppose you've created /user/1, go do /user/1/edit and clear the contact field.
3. Submit. You'll notice that the contact field is left untouched.