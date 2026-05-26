# Inji Branch Move Plan

## Goal

- Move only the `inji` branch contents and history
- Create a new repo in the `inji` org named `documentation`
- Rename the branch to `master`
- Push it to the new repo
- Keep everything isolated from other MOSIP branches

---

## Exact commands

```bash
# 1. Create a fresh local clone of only the inji branch
git clone --single-branch --branch inji https://github.com/mosip/documentation.git inji-documentation
cd inji-documentation

# 2. Rename the current branch to master
git branch -m master

# 3. Remove the old remote and add the new org remote
git remote remove origin
git remote add origin https://github.com/inji/documentation.git

# 4. Push the branch to the new repo as master
git push -u origin master
```

---

## Important notes

- `--single-branch --branch inji` ensures you only clone the `inji` branch and not other MOSIP branches.
- Renaming to `master` makes it the repo’s primary branch immediately.
- The commit history for the `inji` branch is preserved.
- No default MOSIP branches are copied.

---

## Optional reference remote

If you want to keep a reference to the old MOSIP repo:

```bash
git remote add upstream https://github.com/mosip/documentation.git
```

This is optional and only useful if you later want to fetch from the old repo.

---

## GitBook sync after move

After pushing to `https://github.com/inji/documentation.git`, update GitBook to use:

- repository: `https://github.com/inji/documentation.git`
- branch: `master`

If the repo structure stays the same, relative links should continue to work.

---

## Verification

```bash
git log --oneline --decorate --graph --all | head
git remote -v
```

This verifies:

- the history is intact
- `origin` points to the new repo
