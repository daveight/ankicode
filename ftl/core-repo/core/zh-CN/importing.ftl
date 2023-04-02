importing-failed-debug-info = 导入失败。调试信息：
importing-aborted = 已中止：{ $val }
importing-added-duplicate-with-first-field = 已添加首字段的副本：{ $val }
importing-all-supported-formats = 所有支持的格式{ $val }
importing-allow-html-in-fields = 允许在字段中使用HTML
importing-anki-files-are-from-a-very = .anki文件来自Anki较为早期的历史版本。您可以使用「175027074」附加组件或在Anki网站上找到Anki2.0版本来导入它们。
importing-anki2-files-are-not-directly-importable = .anki2文件无法直接导入 - 请导入您接收到的.apkg或.zip文件。
importing-appeared-twice-in-file = 文件中出现两次：{ $val }
importing-by-default-anki-will-detect-the = 默认情况下，Anki将自动检测字段间的分隔字符（如制表符，逗号等）。如未能正确检测分隔字符，请在这里输入。用“\t”代表制表符。
importing-change = 修改
importing-colon = 冒号
importing-comma = 逗号
importing-empty-first-field = 首字段为空: { $val }
importing-field-separator = 字段分隔符
importing-field-mapping = 字段匹配
importing-field-of-file-is = 文件中的第<b>{ $val }</b>个字段为：
importing-fields-separated-by = 字段分隔字符：{ $val }
importing-file-must-contain-field-column = 文件应至少包含一个可以对应到笔记字段的列。
importing-file-version-unknown-trying-import-anyway = 文件版本未知，尝试继续导入。
importing-first-field-matched = 首字段匹配的: { $val }
importing-identical = 完全相同
importing-ignore-field = 忽略字段
importing-ignore-lines-where-first-field-matches = 当导入行的首字段与现有笔记相同时，忽略该行
importing-ignored = <忽略>
importing-import-even-if-existing-note-has = 当导入行的首字段与现有笔记相同时，仍然导入
importing-import-options = 导入选项
importing-importing-complete = 导入成功。
importing-invalid-file-please-restore-from-backup = 无效文件。请从备份恢复。
importing-map-to = 对应到 { $val }
importing-map-to-tags = 对应到标签
importing-mapped-to = 对应到<b>{ $val }</b>
importing-mapped-to-tags = 对应到<b>标签</b>
importing-mnemosyne-20-deck-db = Mnemosyne 2.0 牌组 (*.db)
importing-multicharacter-separators-are-not-supported-please = 不支持多分隔字符，请输入单个分隔字符。
importing-notes-added-from-file = 从文件中添加的笔记：{ $val }
importing-notes-found-in-file = 文件中找到的笔记 : { $val }
importing-notes-skipped-as-theyre-already-in = 因现有集合中已存在而跳过的笔记：{ $val }
importing-notes-that-could-not-be-imported = 因笔记模板已变更而无法导入的笔记：{ $val }
importing-notes-updated-as-file-had-newer = 因文件有新版本而更新的笔记：{ $val }
importing-packaged-anki-deckcollection-apkg-colpkg-zip = 打包的Anki牌组/集合 (*.apkg *.colpkg *.zip)
importing-pauker-18-lesson-paugz = Pauker 1.8 课程 (*.pau.gz)
# the '|' character
importing-pipe = 字符(|)
importing-rows-had-num1d-fields-expected-num2d = “{ $row }”行有 { $found } 个字段，应有 { $expected }
importing-selected-file-was-not-in-utf8 = 选择的文件不是UTF-8格式的。请查看帮助文档的导入章节。
importing-semicolon = 分号
importing-skipped = 已跳过
importing-supermemo-xml-export-xml = Supermemo XML 导出(*.xml)
importing-tab = 制表符
importing-tag-modified-notes = 已修改标签的笔记：
importing-text-separated-by-tabs-or-semicolons = 以制表符或分号分隔的文本 (*)
importing-the-first-field-of-the-note = 笔记模板的首字段必须匹配。
importing-the-provided-file-is-not-a = 此文件不是有效的. apkg文件。
importing-this-file-does-not-appear-to = 此文件不是有效的.apkg文件。如果您是从AnkiWeb下载的，请尝试重新下载。如问题仍然存在，请尝试使用其他浏览器。
importing-this-will-delete-your-existing-collection = 将删除现有集合，并以导入文件中的集合替换，是否确认?
importing-unable-to-import-from-a-readonly = 无法从只读文件中导入。
importing-unknown-file-format = 未知文件格式。
importing-update-existing-notes-when-first-field = 当导入行的首字段与现有笔记相同时，更新笔记
importing-updated = 已更新
importing-note-added =
    { $count ->
       *[other] 已添加{ $count }条笔记
    }
importing-note-imported =
    { $count ->
       *[other] 已导入{ $count }条笔记
    }
importing-note-unchanged =
    { $count ->
       *[other] { $count } 条笔记未变更
    }
importing-note-updated =
    { $count ->
       *[other] 已更新{ $count }条笔记
    }
importing-processed-media-file =
    { $count ->
       *[other] 已导入{ $count }个媒体文件
    }
importing-importing-file = 正在导入文件...
importing-extracting = 数据提取中...
importing-gathering = 数据收集中...
importing-failed-to-import-media-file = 媒体文件导入失败：{ $debugInfo }
importing-processed-notes =
    { $count ->
       *[other] 已处理{ $count }条笔记...
    }
importing-processed-cards =
    { $count ->
       *[other] 已处理{ $count }张卡片...
    }
importing-existing-notes = 现有笔记
# "Existing notes: Duplicate" (verb)
importing-duplicate = 复制
# "Existing notes: Preserve" (verb)
importing-preserve = 保留
# "Existing notes: Update" (verb)
importing-update = 更新
importing-tag-all-notes = 标记所有笔记
importing-tag-updated-notes = 标记已更新的笔记
importing-file = 文件
importing-match-scope = 匹配范围
importing-notetype-and-deck = 卡片模板和牌组

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

importing-importing-collection = 正在导入集合…
importing-unable-to-import-filename = 未能导入{ $filename }：不支持的文件类型
