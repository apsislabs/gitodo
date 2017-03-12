# Gitodo

Gitodo is a small program that lets you write quick developer notes to yourself.

## Installation

Install with:

    $ gem install gitodo

## Usage

    $ gitodo "Don't forget to foo the baz before sending out a code review"
    Todo added. There are 3 todos on branch `master`

    $ gitodo "Also should baz the ding"
    Todo added. There are 4 todos on branch `master`

    $ gitodo --list
    There are 4 todos on branch `master`
        [1] Fix one of the things
        [2] Fix the other of the things
        [3] Don't forget to foo the baz before sending out a code review
        [4] Also should baz the ding

    $ gitodo --done 1, 3
    Finishing 2 todos
        [1] Fix one of the things
        [3] Don't forget to foo the baz before sending out a code review
    Is that correct? [y/n]
    |> y
    Finished two todos! There are 2 todos remaining on branch `master`
        [1] Fix the other of the things
        [2] Also should baz the ding

    $ gitodo --done
    Which todos have you finished?
        [1] Fix the other of the things
        [2] Also should baz the ding
    |> 2
    Finishing 1 todo
        [2] Also should baz the ding
    Is that correct? [y/n]
    |> y
    Finished 1 todo!

    $ gitodo --check
    Check failed! There is 1 todo on branch `master`!
        [1] Fix the order of the things

    $ gitodo --done 1 !
    Finished 1 todo! `master` is clean!

    $ gitodo --check
    Check passed! `master` is clean!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apsislabs/gitodo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
