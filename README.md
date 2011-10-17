Retail Holidays
===============

A quick and dirty gem to see if a date falls on a retail holiday. I use
this to determine if a sub-contractor should be paid weekend/emergency
rates for a site visit at a retail shop.

Usage
-----

    require 'retail_holidays'
    d = Date.civil(2011, 1, 1)
    d.holiday? _#=> true_

Testing
-------

I use:

    $ autotest

There is the default rake task:

    $ rake

Or the more explicit:

    $ rake spec

Otherwise:

    $ rspec spec

Contributing
------------

1. Fork
2. Create a branch (`git checkout -b my_branch`)
3. Commit (`git commit -am "Added coolness"`)
4. Push (`git push origin my_branch`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy

[1]: http://github.com/dogenpunk/retail_holidays/issues
