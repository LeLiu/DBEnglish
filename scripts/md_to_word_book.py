import json
import re
import os

# 文件路径
md_file = 'resource/words/人教版新起点.md'
json_file = 'resource/words/word_book_001.json'
word_table_dir = 'resource/words/word_book_001'

# 读取 Markdown 文件内容
with open(md_file, 'r', encoding='utf-8') as file:
    content = file.read()

# 正则表达式匹配单词条目
pattern = re.compile(r'(\d+)\.\s+(\w+)\s+\|\s+(.+)')

# 初始化词书结构
word_book = {
    "name": "人教版新起点",
    "description": "人教版新起点一到六年级词汇"
    "word_table": []
}

# 当前词表数据
current_word_table = None

# 当前章节和单元
current_chapter = ""
current_unit = ""

# 全局编号
global_no = 1

# 词表计数器
word_table_counter = 1

# 逐行处理文件内容
for line in content.split('\n'):
    # 检测新词表的开始
    if line.startswith('# '):
        # 如果已有词表，保存到词书中和单独的文件中
        if current_word_table and current_word_table['words']:
            word_book['word_table'].append(current_word_table)
            
            # 保存当前词表到单独的文件
            table_file = os.path.join(word_table_dir, f'word_table_{word_table_counter:03d}.json')
            with open(table_file, 'w', encoding='utf-8') as f:
                json.dump(current_word_table, f, ensure_ascii=False, indent=4)
            word_table_counter += 1
        
        # 创建新词表
        current_word_table = {
            'name': line.strip().lstrip('#').strip(),
            'description': '',
            'words': []
        }
        global_no = 1  # 重置编号
        current_chapter = ""
        current_unit = ""
    
    elif line.startswith('## '):
        current_chapter = line.strip().lstrip('#').strip()
    elif line.startswith('### '):
        current_unit = line.strip().lstrip('#').strip()
    else:
        if current_word_table:  # 确保已创建词表
            match = pattern.match(line)
            if match:
                local_no = int(match.group(1))
                word = match.group(2)
                definition = match.group(3)
                loc = f"{current_chapter}::{current_unit}::{local_no}"
                
                word_entry = {
                    "no": global_no,
                    "word": word,
                    "definition": definition,
                    "loc": loc
                }
                
                current_word_table['words'].append(word_entry)
                global_no += 1

# 添加最后一个词表
if current_word_table and current_word_table['words']:
    word_book['word_table'].append(current_word_table)
    # 保存最后一个词表到单独的文件
    table_file = os.path.join(word_table_dir, f'word_table_{word_table_counter:03d}.json')
    with open(table_file, 'w', encoding='utf-8') as f:
        json.dump(current_word_table, f, ensure_ascii=False, indent=4)

# 将结果写入 JSON 文件
with open(json_file, 'w', encoding='utf-8') as file:
    json.dump(word_book, file, ensure_ascii=False, indent=4)

print(f"转换完成，结果已保存到 {json_file}")
print(f"词表文件已保存到 {word_table_dir} 目录")