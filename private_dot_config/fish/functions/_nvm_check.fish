function _nvm_check --on-variable PWD --description 'Do nvm stuff'
    if test -f .nvmrc
        set node_version (nvm current)
        set nvmrc_node_version (nvm list (cat .nvmrc))

        if [ $status = 1 ]
            nvm install
        else if [ $nvmrc_node_version != $node_version ]
            nvm use
        end
    end
end
