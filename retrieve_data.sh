#!/bin/bash

yml_file="params.yml"

mod_version=$(yq e ".version" $yml_file)

mod_size=$(yq e ".size.\"$mod_version\"" "$yml_file")

echo "Retrieved size for version $mod_version is '$mod_size'"

Temp_file="datahub/temp.json"
Data_file="datahub/data.json"

echo "The version is $mod_version"

if [[ -n  "$mod_size" ]]; then
	echo "The size for $mod_version is $mod_size"

	curl -s "https://jsonplaceholder.typicode.com/photos" | jq ".[0:$mod_size]" > "$Temp_file"

	if [[ -f "$Data_file" ]]; then 
	# Compare the newly formed data with the existing data 
		
		if cmp -s "$Temp_file" "$Data_file"; then
			echo "No changes; data has not changed"
			rm "$Temp_file"
			exit 0
		else
			echo "Data is different"
			mv "$Temp_file"  "$Data_file"
			cat "$Data_file"
			
			
		fi
	else
		echo "No existing data file found. Creating new data.json"
		mv "$Temp_file" "$Data_file"
		cat "$Data_file"
		 
	
	fi
else 
	echo "No size found for version $mod_version in params.yml"
    	rm "$Temp_file"  # Clean up temp file
    	exit 1
fi
echo "The current data version is $mod_version"
echo "The data size for version '$mod_version' is '$mod_size'"


