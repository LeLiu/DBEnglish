
words_file = 'resource/words/人教版新起点.md'
temp_file = 'resource/words/人教版新起点_temp.md'

# Read the file content
with open(words_file, 'r', encoding='utf-8') as file:
    content = file.read()

# Replace the separator (assuming the separator is a space or tab) with a vertical bar
modified_content = content.replace('\t', ' | ')

# Write the modified content back to the file
with open(temp_file, 'w', encoding='utf-8') as file:
    file.write(modified_content)
    