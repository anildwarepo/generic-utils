#!/bin/bash

# Check the size of a blob storage container and each file and folder in it

# Set the name of the storage account and container
storage_account_name="anildwaadlsv2"
container_name="folder2"

# Get the storage account key
storage_account_key=$(az storage account keys list --account-name $storage_account_name --query "[0].value" --output tsv)

# Get the size of the container
container_size=$(az storage blob list --account-name $storage_account_name --account-key $storage_account_key --container-name $container_name --query "[].properties.contentLength" --output tsv | awk '{ sum += $1 } END { print sum }')

echo "Container size: $container_size bytes"

# Get the size of each folder and file
blobs=$(az storage blob list --account-name $storage_account_name --account-key $storage_account_key --container-name $container_name --query "[].{name: name, size: properties.contentLength}" --output tsv)

while read -r blob; do
    blob_name=$(echo $blob | awk '{print $1}')
    blob_size=$(echo $blob | awk '{print $2}')
    echo "Blob: $blob_name, Size: $blob_size bytes"
done <<< "$blobs"
