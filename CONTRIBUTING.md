## Contributor license agreement

By submitting code as an individual you agree to the
[individual contributor license agreement](doc/legal/individual_contributor_license_agreement.md).
By submitting code as an entity you agree to the
[corporate contributor license agreement](doc/legal/corporate_contributor_license_agreement.md).

_This notice should stay as the first item in the CONTRIBUTING.MD file._

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Contribute to GitLab](#contribute-to-gitlab)
- [Security vulnerability disclosure](#security-vulnerability-disclosure)
- [Closing policy for issues and merge requests](#closing-policy-for-issues-and-merge-requests)
- [Helping others](#helping-others)
- [I want to contribute!](#i-want-to-contribute)
- [Workflow labels](#workflow-labels)
- [Implement design & UI elements](#implement-design--ui-elements)
- [Release retrospective and kickoff](#release-retrospective-and-kickoff)
  - [Retrospective](#retrospective)
  - [Kickoff](#kickoff)
- [Issue tracker](#issue-tracker)
  - [Feature proposals](#feature-proposals)
  - [Issue tracker guidelines](#issue-tracker-guidelines)
  - [Issue weight](#issue-weight)
  - [Regression issues](#regression-issues)
  - [Technical debt](#technical-debt)
  - [Stewardship](#stewardship)
- [Merge requests](#merge-requests)
  - [Merge request guidelines](#merge-request-guidelines)
  - [Getting your merge request reviewed, approved, and merged](#getting-your-merge-request-reviewed-approved-and-merged)
  - [Contribution acceptance criteria](#contribution-acceptance-criteria)
- [Changes for Stable Releases](#changes-for-stable-releases)
- [Definition of done](#definition-of-done)
- [Style guides](#style-guides)
- [Code of conduct](#code-of-conduct)
- [Contribution Flow](#contribution-flow)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Contribute to GitLab

Thank you for your interest in contributing to GitLab. This guide details how
to contribute to GitLab in a way that is efficient for everyone.

GitLab comes into two flavors, GitLab Community Edition (CE) our free and open
source edition, and GitLab Enterprise Edition (EE) which is our commercial
edition. Throughout this guide you will see references to CE and EE for
abbreviation.

If you have read this guide and want to know how the GitLab [core team]
operates please see [the GitLab contributing process](PROCESS.md).

- [GitLab Inc engineers should refer to the engineering workflow document](https://about.gitlab.com/handbook/engineering/workflow/)

## Security vulnerability disclosure

Please report suspected security vulnerabilities in private to
`support@gitlab.com`, also see the
[disclosure section on the GitLab.com website](https://about.gitlab.com/disclosure/).
Please do **NOT** create publicly viewable issues for suspected security
vulnerabilities.

## Closing policy for issues and merge requests

GitLab is a popular open source project and the capacity to deal with issues
and merge requests is limited. Out of respect for our volunteers, issues and
merge requests not in line with the guidelines listed in this document may be
closed without notice.

Please treat our volunteers with courtesy and respect, it will go a long way
towards getting your issue resolved.

Issues and merge requests should be in English and contain appropriate language
for audiences of all ages.

If a contributor is no longer actively working on a submitted merge request
we can decide that the merge request will be finished by one of our
[Merge request coaches][team] or close the merge request. We make this decision
based on how important the change is for our product vision. If a Merge request
coach is going to finish the merge request we assign the
~"coach will finish" label.

## Helping others

Please help other GitLab users when you can. The channels people will reach out
on can be found on the [getting help page][getting-help].

Sign up for the mailing list, answer GitLab questions on StackOverflow or
respond in the IRC channel. You can also sign up on [CodeTriage][codetriage] to help with
the remaining issues on the GitHub issue tracker.

## I want to contribute!

If you want to contribute to GitLab, but are not sure where to start,
look for [issues with the label `Accepting Merge Requests` and weight < 5][accepting-mrs-weight].
These issues will be of reasonable size and challenge, for anyone to start
contributing to GitLab.

## Workflow labels

Labelling issues is described in the [GitLab Inc engineering workflow].

## Implement design & UI elements

Please see the [UX Guide for GitLab].

## Release retrospective and kickoff

### Retrospective

After each release, we have a retrospective call where we discuss what went well,
what went wrong, and what we can improve for the next release. The
[retrospective notes] are public and you are invited to comment on them.
If you're interested, you can even join the
[retrospective call][retro-kickoff-call], on the first working day after the
22nd at 6pm CET / 9am PST.

### Kickoff

Before working on the next release, we have a
kickoff call to explain what we expect to ship in the next release. The
[kickoff notes] are public and you are invited to comment on them.
If you're interested, you can even join the [kickoff call][retro-kickoff-call],
on the first working day after the 7th at 6pm CET / 9am PST..

[retrospective notes]: https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit?usp=sharing
[kickoff notes]: https://docs.google.com/document/d/1ElPkZ90A8ey_iOkTvUs_ByMlwKK6NAB2VOK5835wYK0/edit?usp=sharing
[retro-kickoff-call]: https://gitlab.zoom.us/j/918821206

## Issue tracker

To get support for your particular problem please use the
[getting help channels](https://about.gitlab.com/getting-help/).

The [GitLab CE issue tracker on GitLab.com][ce-tracker] is for bugs concerning
the latest GitLab release and [feature proposals](#feature-proposals).

When submitting an issue please conform to the issue submission guidelines
listed below. Not all issues will be addressed and your issue is more likely to
be addressed if you submit a merge request which partially or fully solves
the issue.

If you're unsure where to post, post to the [mailing list][google-group] or
[Stack Overflow][stackoverflow] first. There are a lot of helpful GitLab users
there who may be able to help you quickly. If your particular issue turns out
to be a bug, it will find its way from there.

If it happens that you know the solution to an existing bug, please first
open the issue in order to keep track of it and then open the relevant merge
request that potentially fixes it.

### Feature proposals

To create a feature proposal for CE, open an issue on the
[issue tracker of CE][ce-tracker].

For feature proposals for EE, open an issue on the
[issue tracker of EE][ee-tracker].

In order to help track the feature proposals, we have created a
[`feature proposal`][fpl] label. For the time being, users that are not members
of the project cannot add labels. You can instead ask one of the [core team]
members to add the label `feature proposal` to the issue or add the following
code snippet right after your description in a new line: `~"feature proposal"`.

Please keep feature proposals as small and simple as possible, complex ones
might be edited to make them small and simple.

Please submit Feature Proposals using the ['Feature Proposal' issue template](.gitlab/issue_templates/Feature Proposal.md) provided on the issue tracker.

For changes in the interface, it can be helpful to create a mockup first.
If you want to create something yourself, consider opening an issue first to
discuss whether it is interesting to include this in GitLab.

### Issue tracker guidelines

**[Search the issue tracker][ce-tracker]** for similar entries before
submitting your own, there's a good chance somebody else had the same issue or
feature proposal. Show your support with an award emoji and/or join the
discussion.

Please submit bugs using the ['Bug' issue template](.gitlab/issue_templates/Bug.md) provided on the issue tracker.
The text in the parenthesis is there to help you with what to include. Omit it
when submitting the actual issue. You can copy-paste it and then edit as you
see fit.

### Issue weight

Issue weight allows us to get an idea of the amount of work required to solve
one or multiple issues. This makes it possible to schedule work more accurately.

You are encouraged to set the weight of any issue. Following the guidelines
below will make it easy to manage this, without unnecessary overhead.

1. Set weight for any issue at the earliest possible convenience
1. If you don't agree with a set weight, discuss with other developers until
consensus is reached about the weight
1. Issue weights are an abstract measurement of complexity of the issue. Do not
relate issue weight directly to time. This is called [anchoring](https://en.wikipedia.org/wiki/Anchoring)
and something you want to avoid.
1. Something that has a weight of 1 (or no weight) is really small and simple.
Something that is 9 is rewriting a large fundamental part of GitLab,
which might lead to many hard problems to solve. Changing some text in GitLab
is probably 1, adding a new Git Hook maybe 4 or 5, big features 7-9.
1. If something is very large, it should probably be split up in multiple
issues or chunks. You can simply not set the weight of a parent issue and set
weights to children issues.

### Regression issues

Every monthly release has a corresponding issue on the CE issue tracker to keep
track of functionality broken by that release and any fixes that need to be
included in a patch release (see [8.3 Regressions] as an example).

As outlined in the issue description, the intended workflow is to post one note
with a reference to an issue describing the regression, and then to update that
note with a reference to the merge request that fixes it as it becomes available.

If you're a contributor who doesn't have the required permissions to update
other users' notes, please post a new note with a reference to both the issue
and the merge request.

The release manager will [update the notes] in the regression issue as fixes are
addressed.

[8.3 Regressions]: https://gitlab.com/gitlab-org/gitlab-ce/issues/4127
[update the notes]: https://gitlab.com/gitlab-org/release-tools/blob/master/doc/pro-tips.md#update-the-regression-issue

### Technical debt

In order to track things that can be improved in GitLab's codebase, we created
the ~"technical debt" label in [GitLab's issue tracker][ce-tracker].

This label should be added to issues that describe things that can be improved,
shortcuts that have been taken, code that needs refactoring, features that need
additional attention, and all other things that have been left behind due to
high velocity of development.

Everyone can create an issue, though you may need to ask for adding a specific
label, if you do not have permissions to do it by yourself. Additional labels
can be combined with the `technical debt` label, to make it easier to schedule
the improvements for a release.

Issues tagged with the `technical debt` label have the same priority like issues
that describe a new feature to be introduced in GitLab, and should be scheduled
for a release by the appropriate person.

Make sure to mention the merge request that the `technical debt` issue is
associated with in the description of the issue.

### Stewardship

For issues related to the open source stewardship of GitLab,
there is the ~"stewardship" label.

This label is to be used for issues in which the stewardship of GitLab
is a topic of discussion. For instance if GitLab Inc. is planning to remove
features from GitLab CE to make exclusive in GitLab EE, related issues
would be labelled with ~"stewardship".

A recent example of this was the issue for
[bringing the time tracking API to GitLab CE][time-tracking-issue].

[time-tracking-issue]: https://gitlab.com/gitlab-org/gitlab-ce/issues/25517#note_20019084

## Merge requests

We welcome merge requests with fixes and improvements to GitLab code, tests,
and/or documentation. The issues that are specifically suitable for
community contributions are listed with the label
[`Accepting Merge Requests` on our issue tracker for CE][accepting-mrs-ce]
and [EE][accepting-mrs-ee], but you are free to contribute to any other issue
you want.

Please note that if an issue is marked for the current milestone either before
or while you are working on it, a team member may take over the merge request
in order to ensure the work is finished before the release date.

If you want to add a new feature that is not labeled it is best to first create
a feedback issue (if there isn't one already) and leave a comment asking for it
to be marked as `Accepting Merge Requests`. Please include screenshots or
wireframes if the feature will also change the UI.

Merge requests should be opened at [GitLab.com][gitlab-mr-tracker].

If you are new to GitLab development (or web development in general), see the
[I want to contribute!](#i-want-to-contribute) section to get you started with
some potentially easy issues.

To start with GitLab development download the [GitLab Development Kit][gdk] and
see the [Development section](doc/development/README.md) for some guidelines.

### Merge request guidelines

If you can, please submit a merge request with the fix or improvements
including tests. If you don't know how to fix the issue but can write a test
that exposes the issue we will accept that as well. In general bug fixes that
include a regression test are merged quickly while new features without proper
tests are least likely to receive timely feedback. The workflow to make a merge
request is as follows:

1. Fork the project into your personal space on GitLab.com
1. Create a feature branch, branch away from `master`
1. Write [tests](https://gitlab.com/gitlab-org/gitlab-development-kit#running-the-tests) and code
1. [Generate a changelog entry with `bin/changelog`][changelog]
1. If you are writing documentation, make sure to follow the
   [documentation styleguide][doc-styleguide]
1. If you have multiple commits please combine them into a few logically
  organized commits by [squashing them][git-squash]
1. Push the commit(s) to your fork
1. Submit a merge request (MR) to the `master` branch
  1. Your merge request needs at least 1 approval but feel free to require more.
    For instance if you're touching backend and frontend code, it's a good idea
    to require 2 approvals: 1 from a backend maintainer and 1 from a frontend
    maintainer
  1. You don't have to select any approvers, but you can if you really want
    specific people to approve your merge request
1. The MR title should describe the change you want to make
1. The MR description should give a motive for your change and the method you
   used to achieve it.
  1. If you are contributing code, fill in the template already provided in the
     "Description" field.
  1. If you are contributing documentation, choose `Documentation` from the
     "Choose a template" menu and fill in the template.
1. If the MR changes the UI it should include *Before* and *After* screenshots
1. If the MR changes CSS classes please include the list of affected pages,
   `grep css-class ./app -R`
1. Link any relevant [issues][ce-tracker] in the merge request description and
   leave a comment on them with a link back to the MR
1. Be prepared to answer questions and incorporate feedback even if requests
   for this arrive weeks or months after your MR submission
1. If your MR touches code that executes shell commands, reads or opens files or
   handles paths to files on disk, make sure it adheres to the
   [shell command guidelines](doc/development/shell_commands.md)
1. If your code creates new files on disk please read the
   [shared files guidelines](doc/development/shared_files.md).
1. When writing commit messages please follow
   [these](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
   [guidelines](http://chris.beams.io/posts/git-commit/).
1. If your merge request adds one or more migrations, make sure to execute all
   migrations on a fresh database before the MR is reviewed. If the review leads
   to large changes in the MR, do this again once the review is complete.
1. For more complex migrations, write tests.
1. Merge requests **must** adhere to the [merge request performance
   guidelines](doc/development/merge_request_performance_guidelines.md).
1. For tests that use Capybara or PhantomJS, see this [article on how
   to write reliable asynchronous tests](https://robots.thoughtbot.com/write-reliable-asynchronous-integration-tests-with-capybara).

Please keep the change in a single MR **as small as possible**. If you want to
contribute a large feature think very hard what the minimum viable change is.
Can you split the functionality? Can you only submit the backend/API code? Can
you start with a very simple UI? Can you do part of the refactor? The increased
reviewability of small MRs that leads to higher code quality is more important
to us than having a minimal commit log. The smaller an MR is the more likely it
is it will be merged (quickly). After that you can send more MRs to enhance it.
The ['How to get faster PR reviews' document of Kubernetes](https://github.com/kubernetes/community/blob/master/contributors/devel/faster_reviews.md) also has some great points regarding this.

For examples of feedback on merge requests please look at already
[closed merge requests][closed-merge-requests]. If you would like quick feedback
on your merge request feel free to mention someone from the [core team] or one
of the [Merge request coaches][team].
Please ensure that your merge request meets the contribution acceptance criteria.

When having your code reviewed and when reviewing merge requests please take the
[code review guidelines](doc/development/code_review.md) into account.

### Getting your merge request reviewed, approved, and merged

There are a few rules to get your merge request accepted:

1. Your merge request should only be **merged by a [maintainer][team]**.
  1. If your merge request includes only backend changes [^1], it must be
    **approved by a [backend maintainer][team]**.
  1. If your merge request includes only frontend changes [^1], it must be
    **approved by a [frontend maintainer][team]**.
  1. If your merge request includes frontend and backend changes [^1], it must
    be **approved by a [frontend and a backend maintainer][team]**.
1. To lower the amount of merge requests maintainers need to review, you can
  ask or assign any [reviewers][team] for a first review.
  1. If you need some guidance (e.g. it's your first merge request), feel free
    to ask one of the [Merge request coaches][team].
  1. The reviewer will assign the merge request to a maintainer once the
    reviewer is satisfied with the state of the merge request.

### Contribution acceptance criteria

1. The change is as small as possible
1. Include proper tests and make all tests pass (unless it contains a test
   exposing a bug in existing code). Every new class should have corresponding
   unit tests, even if the class is exercised at a higher level, such as a feature test.
1. If you suspect a failing CI build is unrelated to your contribution, you may
   try and restart the failing CI job or ask a developer to fix the
   aforementioned failing test
1. Your MR initially contains a single commit (please use `git rebase -i` to
   squash commits)
1. Your changes can merge without problems (if not please rebase if you're the
   only one working on your feature branch, otherwise, merge `master`)
1. Does not break any existing functionality
1. Fixes one specific issue or implements one specific feature (do not combine
   things, send separate merge requests if needed)
1. Migrations should do only one thing (e.g., either create a table, move data
   to a new table or remove an old table) to aid retrying on failure
1. Keeps the GitLab code base clean and well structured
1. Contains functionality we think other users will benefit from too
1. Doesn't add configuration options or settings options since they complicate
   making and testing future changes
1. Changes do not adversely degrade performance.
   - Avoid repeated polling of endpoints that require a significant amount of overhead
   - Check for N+1 queries via the SQL log or [`QueryRecorder`](https://docs.gitlab.com/ce/development/merge_request_performance_guidelines.html)
   - Avoid repeated access of filesystem
1. If you need polling to support real-time features, please use
   [polling with ETag caching][polling-etag].
1. Changes after submitting the merge request should be in separate commits
   (no squashing). If necessary, you will be asked to squash when the review is
   over, before merging.
1. It conforms to the [style guides](#style-guides) and the following:
    - If your change touches a line that does not follow the style, modify the
      entire line to follow it. This prevents linting tools from generating warnings.
    - Don't touch neighbouring lines. As an exception, automatic mass
      refactoring modifications may leave style non-compliant.
1. If the merge request adds any new libraries (gems, JavaScript libraries,
   etc.), they should conform to our [Licensing guidelines][license-finder-doc].
   See the instructions in that document for help if your MR fails the
   "license-finder" test with a "Dependencies that need approval" error.

## Changes for Stable Releases

Sometimes certain changes have to be added to an existing stable release.
Two examples are bug fixes and performance improvements. In these cases the
corresponding merge request should be updated to have the following:

1. A milestone indicating what release the merge request should be merged into.
1. The label "Pick into Stable"

This makes it easier for release managers to keep track of what still has to be
merged and where changes have to be merged into.
Like all merge requests the target should be master so all bugfixes are in master.

## Definition of done

If you contribute to GitLab please know that changes involve more than just
code. We have the following [definition of done][definition-of-done]. Please ensure you support
the feature you contribute through all of these steps.

1. Description explaining the relevancy (see following item)
1. Working and clean code that is commented where needed
1. Unit and integration tests that pass on the CI server
1. Performance/scalability implications have been considered, addressed, and tested
1. [Documented][doc-styleguide] in the /doc directory
1. Changelog entry added
1. Reviewed and any concerns are addressed
1. Merged by the project lead
1. Added to the release blog article
1. Added to [the website](https://gitlab.com/gitlab-com/www-gitlab-com/) if relevant
1. Community questions answered
1. Answers to questions radiated (in docs/wiki/etc.)

If you add a dependency in GitLab (such as an operating system package) please
consider updating the following and note the applicability of each in your
merge request:

1. Note the addition in the release blog post (create one if it doesn't exist yet) https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/
1. Upgrade guide, for example https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/update/7.5-to-7.6.md
1. Upgrader https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/update/upgrader.md#2-run-gitlab-upgrade-tool
1. Installation guide https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/install/installation.md#1-packages-dependencies
1. GitLab Development Kit https://gitlab.com/gitlab-org/gitlab-development-kit
1. Test suite https://gitlab.com/gitlab-org/gitlab-ce/blob/master/scripts/prepare_build.sh
1. Omnibus package creator https://gitlab.com/gitlab-org/omnibus-gitlab

## Style guides

1.  [Ruby](https://github.com/bbatsov/ruby-style-guide).
    Important sections include [Source Code Layout][rss-source] and
    [Naming][rss-naming]. Use:
    - multi-line method chaining style **Option A**: dot `.` on the second line
    - string literal quoting style **Option A**: single quoted by default
1.  [Rails](https://github.com/bbatsov/rails-style-guide)
1.  [Newlines styleguide][newlines-styleguide]
1.  [Testing](doc/development/testing.md)
1.  [JavaScript styleguide][js-styleguide]
1.  [SCSS styleguide][scss-styleguide]
1.  [Shell commands](doc/development/shell_commands.md) created by GitLab
    contributors to enhance security
1.  [Database Migrations](doc/development/migration_style_guide.md)
1.  [Markdown](http://www.cirosantilli.com/markdown-styleguide)
1.  [Documentation styleguide][doc-styleguide]
1.  Interface text should be written subjectively instead of objectively. It
    should be the GitLab core team addressing a person. It should be written in
    present time and never use past tense (has been/was). For example instead
    of _prohibited this user from being saved due to the following errors:_ the
    text should be _sorry, we could not create your account because:_

This is also the style used by linting tools such as
[RuboCop](https://github.com/bbatsov/rubocop),
[PullReview](https://www.pullreview.com/) and [Hound CI](https://houndci.com).

## Code of conduct

As contributors and maintainers of this project, we pledge to respect all
people who contribute through reporting issues, posting feature requests,
updating documentation, submitting pull requests or patches, and other
activities.

We are committed to making participation in this project a harassment-free
experience for everyone, regardless of level of experience, gender, gender
identity and expression, sexual orientation, disability, personal appearance,
body size, race, ethnicity, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual
language or imagery, derogatory comments or personal attacks, trolling, public
or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or
reject comments, commits, code, wiki edits, issues, and other contributions
that are not aligned to this Code of Conduct. Project maintainers who do not
follow the Code of Conduct may be removed from the project team.

This code of conduct applies both within project spaces and in public spaces
when an individual is representing the project or its community.

Instances of abusive, harassing, or otherwise unacceptable behavior can be
reported by emailing `contact@gitlab.com`.

This Code of Conduct is adapted from the [Contributor Covenant][contributor-covenant], version 1.1.0,
available at [http://contributor-covenant.org/version/1/1/0/](http://contributor-covenant.org/version/1/1/0/).

## Contribution Flow

When contributing to GitLab, your merge request is subject to review by merge request maintainers of a particular specialty.

When you submit code to GitLab, we really want it to get merged, but there will be times when it will not be merged.

When maintainers are reading through a merge request they may request guidance from other maintainers. If merge request maintainers conclude that the code should not be merged, our reasons will be fully disclosed. If it has been decided that the code quality is not up to GitLab’s standards, the merge request maintainer will refer the author to our docs and code style guides, and provide some guidance.

Sometimes style guides will be followed but the code will lack structural integrity, or the maintainer will have reservations about the code’s overall quality. When there is a reservation the maintainer will inform the author and provide some guidance.  The author may then choose to update the merge request. Once the merge request has been updated and reassigned to the maintainer, they will review the code again. Once the code has been resubmitted any number of times, the maintainer may choose to close the merge request with a summary of why it will not be merged, as well as some guidance. If the merge request is closed the maintainer will be open to discussion as to how to improve the code so it can be approved in the future.

GitLab will do its best to review community contributions as quickly as possible. Specially appointed developers review community contributions daily. You may take a look at the [team page](https://about.gitlab.com/team/) for the merge request coach who specializes in the type of code you have written and mention them in the merge request.  For example, if you have written some JavaScript in your code then you should mention the frontend merge request coach. If your code has multiple disciplines you may mention multiple merge request coaches.

GitLab receives a lot of community contributions, so if your code has not been reviewed within 4 days of its initial submission feel free to re-mention the appropriate merge request coach.

When submitting code to GitLab, you may feel that your contribution requires the aid of an external library. If your code includes an external library please provide a link to the library, as well as reasons for including it.

When your code contains more than 500 changes, any major breaking changes, or an external library, `@mention` a maintainer in the merge request. If you are not sure who to mention, the reviewer will add one early in the merge request process.

[core team]: https://about.gitlab.com/core-team/
[team]: https://about.gitlab.com/team/
[getting-help]: https://about.gitlab.com/getting-help/
[codetriage]: http://www.codetriage.com/gitlabhq/gitlabhq
[accepting-mrs-weight]: https://gitlab.com/gitlab-org/gitlab-ce/issues?assignee_id=0&label_name[]=Accepting%20Merge%20Requests&sort=weight_asc
[ce-tracker]: https://gitlab.com/gitlab-org/gitlab-ce/issues
[ee-tracker]: https://gitlab.com/gitlab-org/gitlab-ee/issues
[google-group]: https://groups.google.com/forum/#!forum/gitlabhq
[stackoverflow]: https://stackoverflow.com/questions/tagged/gitlab
[fpl]: https://gitlab.com/gitlab-org/gitlab-ce/issues?label_name=feature+proposal
[accepting-mrs-ce]: https://gitlab.com/gitlab-org/gitlab-ce/issues?label_name=Accepting+Merge+Requests
[accepting-mrs-ee]: https://gitlab.com/gitlab-org/gitlab-ee/issues?label_name=Accepting+Merge+Requests
[gitlab-mr-tracker]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests
[gdk]: https://gitlab.com/gitlab-org/gitlab-development-kit
[git-squash]: https://git-scm.com/book/en/Git-Tools-Rewriting-History#Squashing-Commits
[closed-merge-requests]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests?assignee_id=&label_name=&milestone_id=&scope=&sort=&state=closed
[definition-of-done]: http://guide.agilealliance.org/guide/definition-of-done.html
[contributor-covenant]: http://contributor-covenant.org
[rss-source]: https://github.com/bbatsov/ruby-style-guide/blob/master/README.md#source-code-layout
[rss-naming]: https://github.com/bbatsov/ruby-style-guide/blob/master/README.md#naming
[changelog]: doc/development/changelog.md "Generate a changelog entry"
[doc-styleguide]: doc/development/doc_styleguide.md "Documentation styleguide"
[js-styleguide]: doc/development/fe_guide/style_guide_js.md "JavaScript styleguide"
[scss-styleguide]: doc/development/fe_guide/style_guide_scss.md "SCSS styleguide"
[newlines-styleguide]: doc/development/newlines_styleguide.md "Newlines styleguide"
[UX Guide for GitLab]: http://docs.gitlab.com/ce/development/ux_guide/
[license-finder-doc]: doc/development/licensing.md
[GitLab Inc engineering workflow]: https://about.gitlab.com/handbook/engineering/workflow/#labelling-issues
[polling-etag]: https://docs.gitlab.com/ce/development/polling.html

[^1]: Please note that specs other than JavaScript specs are considered backend
      code.
