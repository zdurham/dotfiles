function ll --wraps=ls --wraps='exa -l -a --icons' --description 'alias ll=exa -l -a --icons'
  exa -l -a --icons $argv; 
end
