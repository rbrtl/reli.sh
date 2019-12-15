#!/bin/bash
# Get Ansible Vault password from macOS Keychain
#
# You will need to create a new password item in the login keychain


SECURITY_BIN=$(which security)


set_vault_account() {
    if [[ ! -z "$ANSIBLE_VAULT" ]]; then
        account_name="$ANSIBLE_VAULT"
    else

        current_path="$(pwd)"

        # Based on the current path, set the account to lookup in the system keychain
        case "$current_path" in
            *XYZ* )
                account_name="xyzvault"
                ;;

            *ABC* )
                account_name="abcvault"
                ;;

            *ansibullbot* )
                account_name="ansibullbot"
                ;;

            * )
                account_name="vault"
                ;;
        esac

    fi
}


get_vault_key() {
    $SECURITY_BIN find-generic-password -a $account_name -w
}


set_vault_account
get_vault_key
