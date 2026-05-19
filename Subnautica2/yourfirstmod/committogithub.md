---
title: Commit to Github
nav_order: 4
parent: Your first SN2 mod
---

# Commit to Github

Now that you have a working mod, we can commit the code to the Github repository that we created earlier.

Before we do, we'll need to tweak our repository config a little:

1. Run GitHub Desktop.

2. If not already selected, select your "Subnautca2Mods" repository from the drop down.

3. You'll see a load of files marked with a green "+" symbol. These are new files that GitHub Desktop has identified, but we don't want to check all of those into our repo.

4. In your repo folder, `\SubnauticaMods\`, there is a file called `.gitignore`. Find it and open it in VS Code.

5. Right at the bottom of the file, add these lines:

   ```
   # UE Mod development files
   */shared/
   ```

6. Now go back into GiitHub Desktop and you'll see a bunch of file disappear, leaving only your mod and config files:![](.\media\githubrepo.png)

7. In the bottom left, enter a summary of what you've done: "Created my first mod" or something similar.

8. Click the "Commit files to main" button.

You've created your first mod and commited the source to your GitHub repository - good work!
