# Contribution Guide to MOSIP

About
=====

This document provides a set of best practices for MOSIP open source contributions - bug reports, code submissions/pull requests, etc.

For the most part, these guidelines apply equally to _any_ repository regardless of programming language or topic. Where applicable, we outline where individual projects/languages may have additional requirements.

Sources
-------

This document is derived from [https://www.contribution-guide.org/](https://www.contribution-guide.org/)

It's expected that over time we will incorporate additional material from our experience and other large projects. We'll update with a list here when that happens.

Version control branching
-------------------------

To know more, read [MOSIP Branching Strategy](https://docs.mosip.io/1.2.0/community/mosip-branching-strategy).

Submitting bugs
===============

Due diligence
-------------

Before submitting a bug, please do the following:

*   Perform **basic troubleshooting** steps:
    
    *   **Make sure you're on the latest version.** If you're not on the most recent version, your problem may have been solved already! Upgrading is always the best first step.
        
    *   **Try older versions.** If you're already _on_ the latest release, try rolling back a few minor versions (e.g. if on 1.2.0.2, try 1.2.0.1 or 1.2.0) and see if the problem goes away. This will help the devs narrow down when the problem first arose in the commit log.
        
    *   **Try switching up dependency versions.** If the software in question has dependencies (other libraries, etc) try upgrading/downgrading those as well.
        
*   **Search the project's bug/issue tracker** to make sure it's not a [known issue](https://mosip.atlassian.net/jira/software/c/projects/MOSIP/issues/?filter=allissues)
    
*   If you don't find a pre-existing issue, consider **checking with** [**community**](https://community.mosip.io), in case the problem is non-bug-related.
    

What to put in your bug report
------------------------------

Make sure your report gets the attention it deserves: bug reports with missing information may be ignored or punted back to you, delaying a fix. The below constitutes a bare minimum; more info is almost always better:

*   **What operating system are you on?** Windows? version, Mac OS X? (10.7.4? 10.9.0?) Linux? (Which distro & version? ), Java (distro & version) Again, more detail is better.
    
*   **Which version or versions of the software are you using?** Ideally, you followed the advice above and have ruled out (or verified that the problem exists in) a few different versions.
    
*   **How can the developer understand what's happening on your end?** Logs of the service where the problem occurs. In case it has dependant services please feel free to attach the log of those services as well.
    
*   **How can the developers recreate the bug on their end?** If possible, include a copy of your code, the command you used to invoke it, and the full output of your run (if applicable.)
    
    *   A common tactic is to pare down your code until a simple (but still bug-causing) "base case" remains. Not only can this help you identify problems which aren't real bugs, but it means the developer can get to fixing the bug faster.
        

Contributing changes
====================

Licensing of contributed material
---------------------------------

Keep in mind as you contribute, that code, docs and other material submitted to open source projects are usually considered licensed under the same terms as the rest of the work.

*   Anything submitted to [Mosip](https://github.com/mosip) falls under the licensing terms in the repository's top-level `LICENSE` file.
    
    *   For example, if a project's/repositories `LICENSE` is MIT-based, contributors should be comfortable with their work potentially being distributed in binary form without the original source code.
        
*   Per-file copyright/license headers are typically extraneous and undesirable. Please don't add your own copyright headers to new files unless the project's license actually requires them!
    
    *   Not least because even a new file created by one individual (who often feels compelled to put their personal copyright notice at the top) will inherently end up contributed to by dozens of others over time, making a per-file header outdated/misleading.
        

Version control branching
-------------------------

*   Always **fork** for your work, no matter how small. This allows you to work independently work without impacting other work.
    
*   Always **make a new branch** for your work, no matter how small. This makes it easy for others to take just that one set of changes from your repository, in case you have multiple unrelated changes floating around.
    
    *   A corollary: **don't submit unrelated changes in the same branch/pull request**! The maintainer shouldn't have to reject your awesome bugfix because the feature you put in with it needs more review.
        
*   **Base your new branch off of the appropriate branch**:
    
    *   **Bug fixes** should be based on the branch named after the **oldest supported release line** the bug affects.
        
        *   E.g. if a feature was introduced in `1.2.0`, the latest release line is `1.2.0.1`, and a bug is found in that feature - make your branch based on `1.2.0.1`. The maintainer will then forward-port it to `1.2.0.2` and `master`.
            
        *   Bug fixes requiring large changes to the code or changes to the `commons` repository which has a chance of being otherwise disruptive may need to base on `develop` instead. This is a judgement call -- ask the devs over the [https://community.mosip.io](https://community.mosip.io)!
            
    *   **New features** should branch off of **the 'develop' branch**.
        
        *   Note that depending on how long it takes for the dev team to merge your patch, the copy of `master` you worked off of may get out of date! If you find yourself 'bumping' a pull request that's been sidelined for a while, **make sure you rebase or merge to the latest master** to ensure a speedier resolution.
            

Code formatting
---------------

*   **Follow the style you see used in the primary repository**! Consistency with the rest of the project always trumps other considerations. It doesn't matter if you have your own style or if the rest of the code breaks with the greater community - just follow along.
    
*   Java projects usually follow the `https://google.github.io/styleguide/javaguide.html`\_> guidelines (though many have minor deviations depending on the lead maintainers' preferences.)
    

Documentation isn't optional
----------------------------

It's not! Patches without documentation will be returned to the sender. By "Documentation" we mean:

*   **Swagger** (for Java; or API-doc-friendly comments for other languages) must be created or updated for public API functions/methods/etc. (This step is optional for some bugfixes.)
    
    *   Don't forget to verify the swagger URL for your new REST api.
        
*   New features should ideally include updates(PR) to [**https://docs.mosip.io**](https://docs.mosip.io), including useful example code snippets.
    
*   All submissions should have a **changelog entry** crediting the contributor and/or any individuals instrumental in identifying the problem.
    

Tests aren't optional
---------------------

Any bugfix that doesn't include a test proving the existence of the bug being fixed, may be suspect. Ditto for new features that can't prove they actually work.

We've found that test-first development really helps make features better architected and identifies potential edge cases earlier instead of later. Writing tests before implementation is strongly encouraged.

Full example
------------

Here's an example workflow for a project `id-repository` hosted on Github, which is currently in version 1.2.x. Your username is `sasi` and you're submitting a basic bugfix.

### Preparing your Fork

1.  Click 'Fork' on Github, creating e.g. `sasi/id-repository`. (choose to fork all the branches)
    
2.  Clone your project: `git clone https://github.com/sasi/id-repository`.
    
3.  `cd id-repository`
    
4.  Add remote upstream `git remote add upstream https://github.com/mosip/id-repository.git`
    
5.  Block push upstream `git remote set-url upstream --push "Do not push"`
    
6.  `git fetch upstream`
    
7.  Create a branch `git branch <bugname or featurename> upstream/1.2.0`
    
8.  Setup the development requirements: `mvn install -Dgpg.skip`. You can use your favourite editor.
    

### Making your Changes

1.  Add changelog entry crediting yourself.
    
2.  Write tests expecting the correct/fixed functionality; make sure they fail.
    
3.  Hack, hack, hack.
    
4.  Run tests again, making sure they dont break.
    
5.  Ensure Sonar code coverage is same as before most of our repo’s have ensure >80%.
    
6.  Commit your changes referring to Jira number in the commit message. Eg: `git commit -m "[MOS-2346] Adding new upload feature in Pre-registration module for POA documents"`
    

### Creating Pull Requests

1.  Push your commit to get it back up to your fork: `git push origin 1.2.0`
    
2.  Visit your Github, click the handy "Contribute" button that it will make upon noticing your new branch and open a pull request.
    
3.  In the description field, write down the issue number (if submitting code fixing an existing issue) or describe the issue + your fix (if submitting a wholly new bugfix).
    
4.  Provide more details about the change to help the reviewers understand your point of view.
    
5.  Hit 'submit'! And please be patient - the maintainers will get to you when  
    they can. In case of urgency feel free to post in [https://community.mosip.io](https://community.mosip.io)
