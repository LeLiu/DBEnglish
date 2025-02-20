import json
import re
import os
import sys

def make_word_book(md_file, book_no):
    # 创建词书目录
    book_dir = f'resource/words/book/{book_no:03d}'
    tables_dir = os.path.join(book_dir, 'tables')
    os.makedirs(tables_dir, exist_ok=True)

    # 读取 Markdown 文件内容
    with open(md_file, 'r', encoding='utf-8') as file:
        content = file.read()

    # 正则表达式匹配单词条目
    pattern = re.compile(r'\s*(\d+)\.\s+([\w-]+)\s*\|\s*([^\n]+)')

    # 初始化词书结构
    word_book = {
        "name": os.path.splitext(os.path.basename(md_file))[0],
        "description": "",
        "tables": []
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

    # 记录是否已经遇到第一个二级标题
    found_first_h2 = False
    # 收集一级标题和第一个二级标题之间的文本
    description_text = []

    # 逐行处理文件内容
    for line in content.split('\n'):
        # 检测新词表的开始
        if line.startswith('## '):
            # 如果这是第一个二级标题，设置词书描述
            if not found_first_h2:
                found_first_h2 = True
                word_book['description'] = '\n'.join(description_text).strip()
                description_text = []

            # 如果已有词表，保存到词书中和单独的文件中
            if current_word_table and current_word_table['words']:
                # 生成词表文件路径
                table_file = f'tables/table_{word_table_counter:03d}.json'
                table_path = os.path.join(book_dir, table_file)

                # 添加词表信息到词书
                word_book['tables'].append({
                    'name': current_word_table['name'],
                    'file': table_file
                })

                # 保存词表文件
                with open(table_path, 'w', encoding='utf-8') as f:
                    json.dump(current_word_table, f, ensure_ascii=False, indent=4)
                word_table_counter += 1

            # 创建新词表
            current_word_table = {
                'name': line.strip().lstrip('#').strip(),
                'words': []
            }
            current_chapter = current_word_table['name']
            current_unit = ""

        elif line.startswith('### '):
            current_unit = line.strip().lstrip('#').strip()
        elif not found_first_h2 and line.strip() and not line.startswith('#'):
            # 收集一级标题和第一个二级标题之间的文本
            description_text.append(line.strip())
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
        table_file = f'table/table_{word_table_counter:03d}.json'
        table_path = os.path.join(book_dir, table_file)

        word_book['tables'].append({
            'name': current_word_table['name'],
            'file': table_file
        })

        with open(table_path, 'w', encoding='utf-8') as f:
            json.dump(current_word_table, f, ensure_ascii=False, indent=4)

    # 保存词书主文件
    book_file = os.path.join(book_dir, 'book.json')
    with open(book_file, 'w', encoding='utf-8') as f:
        json.dump(word_book, f, ensure_ascii=False, indent=4)

    print(f"词书已生成在目录: {book_dir}")

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("用法: python make_word_book.py <markdown文件> <词书编号>")
        sys.exit(1)

    md_file = sys.argv[1]
    book_no = int(sys.argv[2])  # 将字符串转换为整数
    make_word_book(md_file, book_no)