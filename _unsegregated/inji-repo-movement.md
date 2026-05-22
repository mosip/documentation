Yes, it is entirely possible to move this branch into a completely separate repository under a new organization (like `inji`) and make it the `master` (or `main`) branch.

However, since you cannot directly "convert" a branch of an existing repository into a brand-new repository in a different organization via a simple button click, you will need to do this using standard Git commands.

Here is the best way to do it while **preserving your entire commit history** for the `inji` branch:

---

### Step 1: Create the New Repository

1. Go to GitHub and navigate to your new **inji** organization.
2. Create a brand new, empty repository (e.g., `documentation`).
3. *Note: Do not initialize it with a README, `.gitignore`, or license. Leave it completely blank.*

### Step 2: Clone and Isolate the Branch Locally

Open your terminal and run the following commands to pull just the `inji` branch:

```bash
# Clone the MOSIP documentation repository using the specific branch
git clone -b inji https://github.com/mosip/documentation.git

# Move into the cloned directory
cd documentation

```

### Step 3: Rename the Branch to Master

If you want this branch to serve as your primary branch in the new repository, you can rename it locally before pushing:

```bash
# Rename the current 'inji' branch to 'master' (or 'main')
git branch -m master

```

### Step 4: Point to the New Organization and Push

Now, you need to change the remote URL so Git knows to send the code to your new organization instead of `mosip`.

```bash
# Rename the old remote reference just in case
git remote rename origin old-origin

# Add your new repository as the new origin
# (Replace YOUR-NEW-ORGANIZATION with 'inji' or your exact org name)
git remote add origin https://github.com/YOUR-NEW-ORGANIZATION/documentation.git

# Push the master branch along with all its history to the new repo
git push -u origin master

```

---

### Alternative: Git Subtree (If `inji` is a subfolder)

If `inji` was actually a subfolder inside the main branch that you wanted to split out into its own repository, you would use `git subtree split`. However, looking at your screenshot, `inji` is already a dedicated branch, so the 4 steps above are the cleanest and easiest way to achieve your goal!
