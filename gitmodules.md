##download a repository with submodules
```bash
git clone URL MAIN_REPO_DIR
git submodule init
git submodule update
```

##add new submodule
```bash
cd MAIN_REPO_DIR
git submodule add SUBMODULE_URL SUBMODULE_DIR
git submodule init
git submodule update
git add SUBMODULE_DIR
```

##remove submodule
```bash
cd MAIN_REPO_DIR
git rm -r --cached SUBMODULE_DIR
rm -r SUBMODULE_DIR
vim .gitmodules #delete the entry for the submodule you just removed
```

##update individual submodule
```bash
cd SUBMODULE_DIR
git pull
cd MAIN_REPO_DIR
git add SUBMODULE_DIR
```

##update references others have made to newer versions of submodules
```bash
cd MAIN_REPO_DIR
git submodule update
```
