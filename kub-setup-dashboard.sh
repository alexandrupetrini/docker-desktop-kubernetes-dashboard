#! /bin/bash
echo -e '\n======================================================='
echo -e '# Install the Dashboard application into our cluster:'
wget https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml -O dashboard.yaml && kubectl apply -f ./dashboard.yaml || kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml

echo -e '\n======================================================='
echo -e '# Create a new ServiceAccount:'
kubectl apply -f ./ServiceAccount.yaml

echo -e '\n======================================================='
echo -e '# Create a ClusterRoleBinding for the ServiceAccount:'
kubectl apply -f ./ClusterRoleBindingServiceAccount.yaml

echo -e '\n======================================================='
echo -e '# Start a kubectl proxy (in the background):'
kubectl proxy &

echo -e '\n======================================================='
echo -e '# Enter the URL on your browser: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/'

echo -e '\n======================================================='
echo -e '# Use token to authenticate:'
sh ./kub-get-secret.sh

# This doesn't work. User token only
# echo -e '\n======================================================='
# echo -e '# Create conf file:'
# TOKEN=$(kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') | grep 'token:' | awk '{print $2}')
