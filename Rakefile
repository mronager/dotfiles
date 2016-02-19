require 'rake'

# Install everything
desc "install all dependencies"
task :install do
    install_task "brew", "Brew"
    install_task "git", "Git"
    install_task "iterm", "iTerm2"
    install_task "sublime", "Sublime"
    install_task "tmux", "tmux"
    install_task "vim", "vim"
    install_task "zsh", "zsh extensions"
end

namespace :install do
    desc "install brew dependencies"
    task :brew do
        run %{ bin/brew.sh }
    end

    desc "install osx stuff"
    task :osx do
        run %{ bin/osx.sh }
    end

    task :rvm do
        install_brew
        run %{ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 }
        run %{ curl -sSL https://get.rvm.io | bash -s stable --ruby }
        reload_zsh
    end

    desc "install git stuff"
    task :git do
        run %{ gem install git-up }
        install_files "git/*"
    end

    desc "install iterm stuff"
    task :iterm do
        run %{ open "iterm/Solarized Dark.itermcolors" }
    end

    desc "install sublime stuff"
    task :sublime do
        # Symlink subl
        run %{ ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl }
        # install preferences theme
        run %{ cp -r sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null }
    end

    desc "install tmux stuff"
    task :tmux do
        install_files "tmux/*"
    end

    desc "install vim stuff"
    task :vim do
        install_files "vim/"
        run %{ ln -sf ~/.vim/vimrc ~/.vimrc }
        # Install vundle
        vundle_path = File.join('vim','bundle', 'vundle')
        run %{ git clone https://github.com/gmarik/vundle.git #{vundle_path} } unless File.exists?(vundle_path)
        reload_vundle
    end

    desc "install zsh stuff"
    task :zsh do
        # install ohmyzsh
        run %{ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" }
        install_files "zsh/"
        reload_zsh
    end
end

private
def install_task(task, name)
    puts "[Installing #{name}]"
    Rake::Task["install:#{task}"].execute
end

def run(cmd)
    puts "[Running] #{cmd}"
    `#{cmd}` unless ENV['DEBUG']
end

def install_brew
    run %{ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" }
end

def install_files(dir)
    Dir.glob("#{dir}").each do |f|
        file = f.split('/').last
        source = "#{ENV["PWD"]}/#{f}"
        target = "#{ENV["HOME"]}/.#{file}"

        if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
            puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
            run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
        end

        run %{ ln -nfs "#{source}" "#{target}" }
    end
end

def reload_zsh
    run %{ source ~/.zshrc }
end

def reload_vundle
    run %{ vim --noplugin -N "+set hidden" "+syntax on" +BundleClean +BundleInstall! +qall }
end
