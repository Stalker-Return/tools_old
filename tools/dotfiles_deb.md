[The best detailed explanation](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained) :+1:
<br/>
**Setup git config**<br/>
git config --global user.email "eduard.babyshenko@google.com"<br/>
git config --global user.name "Stalker-Return"<br/>
<br/>
**Arrange Git repository**<br/>
git init --bare $HOME/.dotfiles<br/>
alias gitbr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'<br/>
gitbr config status.showUntrackedFiles no<br/>
gitbr remote add origin https://github.com/Stalker-Return/dotfiles.git<br/>
<br/>
**Add alias to .bashrc if necessary**<br/>
echo "alias gitbr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc<br/>
**Reset remote url if necessary**<br/>
gitbr remote set-url origin git@gitlab.com:Stalker.Return/dotfiles.git<br/>
<br/>
**Add, commit and push to the remote**<br/>
gitbr status<br/>
gitbr add .bashrc<br/>
gitbr commit -m "Added bashrc"<br/>
gitbr push -u<br/>
gitbr push --set-upstream origin master (for the first time)<br/>
<br/>
**[Install](https://www.atlassian.com/git/tutorials/dotfiles<br/>) your dotfiles onto a new system (or migrate to this setup):**<br/>
**Run the [script](https://github.com/Stalker-Return/.dotfiles/blob/master/scripts/fucking_dangerouse_script) to back up the files**<br/>
echo ".dotfiles" >> .gitignore<br/>
git clone --bare https://github.com/Stalker-Return/.dotfiles.git $HOME/.dotfiles<br/>
alias gitbr='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'<br/>
gitbr config status.showUntrackedFiles no<br/>
gitbr checkout<br/>