# Just trying to note a few things related to my Python dev env

I chose to use the pylint for linting and yapf for code-formatting, both are
available at Pacman

    pacman -Syu python-pylint yapf

I then added a :ALEFix call on BufWrite events in vim, which acts like with
gofmt simply always fixing any file

For Ale to really work with e.g. python code i had to add a plugin for a better
linting with Django specficially which is kind of weird, but OK: [pylint Django](https://github.com/PyCQA/pylint-django)
