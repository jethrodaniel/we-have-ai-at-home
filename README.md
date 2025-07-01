# we have AI at home

A local AI chatbot web app.

## tech stack

Web app:

- [Rails 8](https://rubyonrails.org), with
  - [Hotwire](https://hotwired.dev)/[Stimulus](https://stimulus.hotwired.dev)
  - [SQLite](https://sqlite.org/index.html)
  - [Bootstrap](https://getbootstrap.com/docs/5.3)

LLM integration:

- OpenAI-compatible API server: [llama.cpp](https://github.com/ggml-org/llama.cpp)
- Models: TODO

## prerequisites

Install [Ruby](https://www.ruby-lang.org) - e.g, if you're using [asdf](https://asdf-vm.com):

```
# ubuntu
sudo apt update -y && sudo apt install -y build-essential autoconf libssl-dev libyaml-dev zlib1g-dev libffi-dev libgmp-dev rustc

# mac
brew install asdf

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
```

```console
$ ruby -v
ruby 3.4.4 (2025-05-14 revision a38531fd3f) +PRISM [arm64-darwin24]
```

## setup

```
bin/setup
```

Then visit http://localhost:3000 in your browser.

## license

TODO
