#!/bin/bash
export getid="$(terraform show -json |jq '.values.root_module.resources[].values|select(.name=="vrSubnet")|{id: .id}'|awk -F \: '{print $2}')"
export getlocation="$(terraform show -json |jq '.values.root_module.resources[0]|.values.location'|awk -F \" '{print $2}')"
export rg="$(terraform show -json |jq '.values.root_module.resources[1]|.values.resource_group_name'|awk -F \" '{print $2}')"
az network vrouter create --name "vrouter1" --resource-group ${rg} --hosted-subnet ${getid} --location ${getlocation}
