I18n Env Var Lookup [![Build Status](https://app.travis-ci.com/StaymanHou/i18n-env-var-lookup.svg?branch=master)](https://app.travis-ci.com/StaymanHou/i18n-env-var-lookup)
=====================

Provides a backend to the i18n gem to allow a definition to contain embedded references to environment variables by introducing the special embedded marker `~{}`.

All definitions are lazily evaluated on lookup, and once compiled they're written back to the translation store so that all interpolation happens once.

### Example

    # .env
    APP_NAME=An International App

    # example.yml
    home:
      index:
        seo_title: Home | ~{APP_NAME}

`<%= t '.seo_title' %>` will correctly evaluate to `Home | An International App`.

Use double tildes to escape. e.g. `~~{APP_NAME}`

### Installation

Install the gem either by putting it in your `Gemfile`

    gem 'i18n-env-var-lookup'
or by installing it using rubygems

    gem install i18n-env-var-lookup

Add it to your existing backend by adding these lines to your `config/initializers/i18n.rb` (create one if one doesn't exist):

    # config/initializers/i18n.rb
    require 'i18n/backend/env_var_lookup'
    I18n::Backend::Simple.send(:include, I18n::Backend::EnvVarLookup)

Of course you can replace the `I18n::Backend::Simple` with whatever backend you wish to use.

### Credit

This gem is heavily inspired by the [i18n-recursive-lookup gem](https://github.com/annkissam/i18n-recursive-lookup)
