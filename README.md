# maven-automatic-git-hook
Example project that demonstrates how to install a git hook simply and automatically.

## Motivation, Purpose, or, "Why did you feel the need to create this project?"
Any developer (who has worked on a team) has been involved in discussions about coding
standards. Even though that process is usually completely devoid of fun, the difficulty
is not in coming up with these standards.  Eventually, either by unanimous agreement,
or by authoritative declaration, or somewhere in between, your team will eventually
establish its standards.  The difficulty lies in coming up with an easy (read: automatic,
effortless, consistent, and failsafe) way of ensuring that these standards are enforced.
Furthermore, when the team updates these standards, we have the maintenance issue of
ensuring that these updated standards are applied when they become available.

Since we have decided on standards, we want them to be enforced.  We should assume that
our developers are on our team because they want to be there, and that they are not
intentionally going to try to circumvent whatever we put into place to evaluate our
code and to enforce our standards.  However, it is quite preferable to keep all of this
transparent to the team members while they go about their daily development tasks. If
we want to enforce a coding style, or if we want to run a lint tool, or findbugs/pmd,
how can we make that happen as part of our normal tasks?

Git to the (at least partial) rescue!

We are as familiar with version control as we are familiar with team standards.  Most
of us have some experience with git hooks, so we can utilize these git lifecycle
scripts for enforcing the parts of our team standards that can be codified into
configuration or other artifacts that can be used by various tools.

This project demonstrates how simple it can be to include git hooks that can be kept
under version control right inside the repository to which your standards apply, and
installed in your team members' locally cloned git repositories.  Above, I mentioned
the concept of ease and transparency, and we can achieve that by utilizing maven in
order to install the hooks locally, so that they run when team members invoke various
git commands.

This is just a basic project to introduce the concept of version-controlling your git
hooks, and installing them automatically whenever a developer on your team (even if
that team consists only of yourself, or if your team includes any number of developers)
first joins and begins to work on the project, or if a member of your team does a fresh
checkout on their current, or a new, development environment.

## Getting started
Getting started is simple, and you already know how to do it.  Just run mvn clean install,
or any other maven command that runs the `initialize` stage.  The maven-exec-plugin will
tell /bin/bash to run [git-install-hooks.sh](project-resources/scripts/git-install-hooks.sh).
That script, in turn, ensures that [pre-commit.sh](project-resources/git/hooks/pre-commit.sh)
is executable, and then it creates a symlink (or updates it, if it already exists) to that
script as [${project.basedir}/.git/hooks/pre-commit](.git/hooks/pre-commit).

## Doing more, or, "How can I make this actually useful?"
Now that you can see how easily we can create a git hook, and install it when a developer
attempts to perform a maven build on the project, taking it to the next step is
straightforward.  Invoke your tools within the git hook shell scripts at the most
appropriate lifecycle phase.  I will leave the mechanics of that as an exercise for the
reader, since there are a number of tools that you might be interested in using.  Knowledge
of how to invoke those tools, and knowledge of bash scripting will get you there without
too much trouble.

In the future, I might add the use of the google java code formatter to this example.