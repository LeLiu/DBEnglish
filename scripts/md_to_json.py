import json
import re

# 文件路径
md_file = 'resource/words/人教版新起点.md'
json_file = 'resource/words/人教版新起点.json'

# 读取 Markdown 文件内容
with open(md_file, 'r', encoding='utf-8') as file:
    content = file.read()

# 正则表达式匹配单词条目
pattern = re.compile(r'(\d+)\.\s+(\w+)\s+\|\s+(.+)')

# 初始化结果列表
result = []

# 当前章节和单元
current_chapter = ""
current_unit = ""

# 全局编号
global_no = 1

# 逐行处理文件内容
for line in content.split('\n'):
    if line.startswith('## '):
        current_chapter = line.strip().lstrip('#').strip()
    elif line.startswith('### '):
        current_unit = line.strip().lstrip('#').strip()
    else:
        match = pattern.match(line)
        if match:
            local_no = int(match.group(1))
            word = match.group(2)
            definition = match.group(3)
            loc = f"{current_chapter}::{current_unit}::{local_no}"
            result.append({
                "no": global_no,
                "word": word,
                "definition": definition,
                "loc": loc
            })
            global_no += 1

# 将结果写入 JSON 文件
with open(json_file, 'w', encoding='utf-8') as file:
    json.dump(result, file, ensure_ascii=False, indent=4)

print(f"转换完成，结果已保存到 {json_file}")
