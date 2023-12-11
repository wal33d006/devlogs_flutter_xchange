#NOTE:
# 1) This script work after we added mason.
# 2) This script will do proper naming conventions for folder and files irrespective of what you type in terminal as feature name.
# 3) For this script to work You have to give absolute path of your brick (i.e User/project/tools/mason_templates/page) in brick.json & mason-lock.json

feature_path="lib/features/"
#Convert feature name to snack case
to_snake_case() {
    local input_variable="$1"
    local snake_case_variable
    # Convert to snake_case
    snake_case_variable=$(echo "$input_variable" | sed 's/ /_/g; s/\([a-z0-9]\)\([A-Z]\)/\1_\2/g' | tr '[:upper:]' '[:lower:]')
    echo "$snake_case_variable"
}

#Convert feature name to pascal case
to_pascal_case() {
    local input_variable="$1"
    local pascal_case_variable
    # Convert to PascalCase
    pascal_case_variable=$(echo "$input_variable" | sed 's/_\([a-z]\)/\U\1/g')
    echo "$pascal_case_variable"
}

#Ask for feature name
echo "Enter feature name"

#Get input name which you type
read featureName

#Converting feature name to snack case for making folder in lib/presentation
feature_folder=$(to_snake_case $featureName)

#Converting feature name to snack case
snake_case_feature_name=$(to_snake_case $featureName)

#Making a directory of feature
mkdir "$feature_path$feature_folder"

#Going to mason templates to make feature
cd tools/mason_templates

#Making feature and saving it in lib/features/{our_feature_folder}/{our_feature_5_files}
#Here ../../$feature_path$snake_case_feature_name/ means that we are going back 2 times
mason make page -o ../../$feature_path$feature_folder/ --name "$snake_case_feature_name"

