function _nvm_check --on-variable PWD --description 'Autoload node version from .nvmrc'
    if test -f .nvmrc
        set -l nvmrc_version (string trim (cat .nvmrc))
        set -l current_version (node -v 2>/dev/null | string trim -l -c v)
        if test "$nvmrc_version" != "$current_version"
            if not nvm use $nvmrc_version >/dev/null 2>&1
                nvm install $nvmrc_version >/dev/null 2>&1
                echo "nvm: installed node $nvmrc_version"
            end
        end
    end
end
