+++
archetype = "chapter"
title = "Making Contributions"
weight = 0
+++


Since we are using GitHub for hosting and updating the site, we can leverage the functionality of Git to allow everyone to make contributions to the site. However, a few rules must be followed for this to continue to be viable as a documentation solution.

1. ***No internal information.*** This site is *very* public. Anybody with the url can navigate here. Therefore, documentation here should be restricted to resources and techniques that can be learned from other publicly available resources.
2. ***Use proper Markdown.*** If there isn't one up yet, we will include a page with a guide to markdown for those that are unfamiliar, but by starting with the proper formatting it makes it easier to approve and push new documentation. Use current pages to get an idea of what the formatting should look like.

These rules are in no way set in stone, and can be changed as needed.

## Methods of Contributing

We recognize that Git can be weird and confusing for those that don't regularly use it, so we'll support a couple methods of making contributions. However, everyone should at least *try* to use the built-in functionality of Git, and ask questions when needed, so we can all learn and grow.

### Using Git

Using Git is a little complicated due to the nature of change control. However, we'll make this section as concise as possible to try and alleviate confusion. We're assuming you already have Git installed on your computer and have it attached to a GitHub account. If it doesn't already exist, documentation is planned to walk through this process.

#### First time

1. Request Push Access. Josh will need your GitHub username or email to add you as a collaborator.
2. Grab the repo in Git. `git clone https://github.com/jwmasekre/cybermice.dev.git`

#### Every time:

1. Verify you have the latest files. `git pull`
2. Create a branch for your contribution. `git branch <yourbranchnamehere>`
3. Switch to the branch. `git checkout <yourbranchnamehere>`
4. Add your contribution. The markdown documents Hugo uses to generate the static pages is stored in `./content`. If an appropriate category already exists, feel free to place your markdown document in that category's directory. If not, go ahead and create one that you feel is most apt for the contribution. Before it gets pushed we can discuss as a team how to best categorize it.
5. Index the contribution. `git add --all`
6. Commit the contribution. `git commit -m "<your description/comment here>"`
7. Push the contribution. `git push -u origin <yourbranchnamehere>`
8. Submit the pull request. This requires you to go to `https://github.com/jwmasekre/cybermice.dev`, click the branch icon (`master`), and then click `View all branches`. From there, click `New pull request` next to the branch that you created. Change the title to something easy to parse, and leave a comment describing the contribution. Click `Create pull request`.
9. Josh will review it, and if accepted then pull it into `master` and then build the page with Hugo. Merging will also auto-delete the branch.

### Submitting to Josh

By far the easiest method is submitting the markdown document to Josh and having him update on his end. This works just fine, but it doesn't give us the opportunity to familiarize with Git. Just leverage the discord to make submissions this way.