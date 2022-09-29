#!/bin/bash
read -p "Insert your email: " EMAIL
ssh-keygen -t rsa -b 4096 -C $EMAIL
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
echo '\nPublic key:'
cat ~/.ssh/id_rsa.pub
echo '''
__________________________________________________________________________________

Next step:

1)Log in to your github acc;
2)go to https://github.com/settings/keys;
3)Then, follow this tutorial https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
to add the keys on your acc.

'''
read -p "Press enter to check connection: " NEXT
ssh -vT git@github.com
read -p "Enter the ssh URL SSH of your repo: " REPO
git clone $REPO