** Simple notes for a Linux user**
<br/>
**Setup GIT config**<br/>
git config --global user.email "eduard.babyshenko@google.com"<br/>
git config --global user.name "Stalker-Return"<br/>
<br/>
**Install Bare Repository** <br/>
git init --bare $HOME/.git/tools
<br/>
alias gittls='/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/'
<br/>
gittls config status.showUntrackedFiles no
<br/>
gittls remote add origin git@github.com:Stalker-Return/tools.git
<br/>
**Or only update, if the errorr "fatal: remote origin already exists", ocured:** <br/>
gittls remote set-url origin git@github.com:Stalker-Return/tools.git
<br/><br/>
**Add the alias to the bashrc if you want** <br/>
echo "alias gittls='/usr/bin/git --git-dir=$HOME/.git/tools/ --work-tree=$HOME/Clouds/Dropbox/BackUps/Linux/'" >> $HOME/.bashrc
<br/><br/>
**Add, commit and push to the remote**<br/>
gittls status <br/>
gittls add README.md <br/>
gittls commit -m "Upload README.md" <br/>
gittls push -u
<br/>
**For the first time:**<br/>
gittls push --set-upstream origin master<br/>
