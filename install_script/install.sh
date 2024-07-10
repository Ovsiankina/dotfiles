#!/bin/bash                                                                  
                                                                             
sudo pacman -Syu git stow neovim zsh zoxide gcc bat tmux which starship fzf thefuck neofetch eza zip unzip texlive
git clone https://github.com/Ovsiankina/dotfiles.git                        
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier                 

# For textlab (LaTeX) tree-sitter
npm install -g tree-sitter-cli
                                                                              
chsh -s /bin/zsh
                                                                              
# if does not work                                                            
# cat /etc/shells and take the paath for zsh then retry with manually inserting the path
                                                                              
                                                                              
echo "Please run manually:"
echo "cd ~/dotfiles"                                                                 
echo "cd stow --adopt ."                                                                  
echo "source ~/dotfiles/.zshrc" 
echo  "and enter tmux and use '<TMUX-leader> + I' to install tmux plugins"  
