language_Simplified_Chinese:
; lib\lib_bindWins.ahk
global lang_bw_noWIRini:="CapsLock+winsInfosRecorder.ini 不存在"

; lib_clq.ahk
global lang_clq_addIni:="確定將以下字符串簡寫成 {replace0}，並記錄到 {replace1}？"
global lang_clq_existing:="{replace0}`n已存在於 {replace1}，確定用以下設置覆蓋？"
global lang_clq_qrunFileNotExist:="QRun中存在以下記錄，而對應文件（文件夾）不存在，是否刪除該設置？"
global lang_clq_noCmd:="沒有該命令"
global lang_clq_emptyFolder:="<空文件夾>"

; ydTrans.ahk
global lang_yd_translating:="翻譯中...  （如果網絡太差，翻譯請求會暫時阻塞程序，稍等就好）"
global lang_yd_name:="有道翻譯"
global lang_yd_needKey:="缺少有道翻譯API的key，有道翻譯無法使用"
global lang_yd_fileNotExist:="文件（文件夾）不存在"
global lang_yd_errorNoNet:="發送異常，可能是網絡已斷開"
global lang_yd_errorTooLong:="部分句子過長"
global lang_yd_errorNoResults:="無詞典結果"
global lang_yd_errorTextTooLong:="要翻譯的文本過長"
global lang_yd_errorCantTrans:="無法進行有效的翻譯"
global lang_yd_errorLangType:="不支持的語言類型"
global lang_yd_errorKeyInvalid:="無效的key"
global lang_yd_errorSpendingLimit:="已達到今日消費上限，或者請求長度超過今日可消費字符數"
global lang_yd_errorNoFunds:="帳戶餘額不足"
global lang_yd_trans:="------------------------------------有道翻譯------------------------------------"
global lang_yd_dict:="------------------------------------有道詞典------------------------------------"
global lang_yd_phrase:="--------------------------------------短語--------------------------------------"
global lang_yd_free_key_unavailable_warning:="有道翻譯已經不再提供免費的翻譯 API，現在只能使用收費 API（新賬號有試用額度），請參考 CapsLock+settingsDemo.ini 文件中 [TTranslate] 部分的說明設置密鑰後使用翻譯功能。"

global lang_settingsFileContent:=""
lang_settingsFileContent=
(
;------------ Encoding: UTF-16 ------------
;請對照 CapsLock+settingsDemo.ini 來配置相關設置
[Global]

loadScript=scriptDemo.js

[QSearch]

[QRun]

[QWeb]

[TabHotString]

[QStyle]

[TTranslate]

[Keys]

)
global lang_settingsDemoFileContent_1:=""
global lang_settingsDemoFileContent_2:=""
lang_settingsDemoFileContent_1=
(
;------------ Encoding: UTF-16 ------------
; # CapsLock+ 設置樣本
; - ******請務必閱讀以下說明：******

; - **這裡的設置是只讀的，僅作說明參考，不要修改這裡的設置（修改了也無效），需要自定義設置請在 CapsLock+settings.ini 中的對應段名中作添加修改
;     例如，需要開啟開機自啟動，請在 CapsLock+settings.ini 的 [Global] 下添加：autostart=1，並保存

; - "[]"裡面是段名，不能修改
; - 各段下所有設置的格式都為：鍵名=鍵值，每行一個
; - 雖然 QSearch,QRun 和 QWeb 是不同的段，理論上它們的鍵名可以重複，但請不要這樣設置，否則 +Q 的快速啟動功能會無法區分
; - 分號開頭的是注釋行，注釋行不影響設置，就像這幾行
; - 以下把 Capslock+Q 彈出的輸入框稱為 "Qbar"


;----------------------------------------------------------------
; ## 全局設置
[Global]
;是否開機自啟動，1為是，0為否（默認）。
autostart=0

;熱鍵布局方案，可選值：
;- capslock_plus  Capslock+ 3.0 之前的布局
;- capslox（默認）  Capslock+ 3.0 之後的布局
default_hotkey_scheme=capslox

;需要加載的 JavaScript 文件，以逗號分隔，文件應放在與 Capslock+ 程序同文件夾下的 loadScript 文件夾。
;Capslock+ 將會按照順序加載，加載完後 +Tab 可以使用裡面的函數
;在本設置不為空時，啟動 Capslock+ 時將自動創建 loadScript 文件夾，以及位於文件夾中的 debug.html 和 scriptDemo.js 文件
loadScript=myScript1.js,myScript2.js, myScript3.js , myScript4.js

;按下 Capslock+LAlt 鍵時，臨時改變鼠標速度，範圍是1~20。不設置的話默認3
;可以用 Capslock+LAlt+鼠標滾輪上 / 下快速設置這個值
mouseSpeed=3

;是否允許獨立剪貼板功能，1為是（默認），0為否
allowClipboard=1

;是否開啟程序加載動畫，1是（默認），0否
loadingAnimation=1

;----------------------------------------------------------------
; ## Qbar搜索指令設置

; - 除default外的鍵名為搜索指令，該指令會按對應的搜索鏈接搜索關鍵詞，例如：
;        這裡設置了"bd=https://www.baidu.com/s?wd={q}"，可以在 Qbar 輸入"bd capslock+"來百度搜索關鍵詞"capslock+"
;   （不過bd這個指令已經自帶，不需要設置，但可以通過將bd設置成別的鏈接來替換成別的搜索）

; - default為不輸入任何指令時將使用的搜索

; - 鍵名可以自定義，如果下列例子中鍵名對應的鍵值沒有被修改，Capslock+將保留相應的搜索指令

; - 每個網站的搜索鏈接（這裡的鍵值）都不一樣，可以嘗試這樣獲取（不保證準確）：
;    1. 打開需要獲取搜索鏈接的網站
;    2. 在搜索欄輸入任意字符，例如"capslockplus"，搜索（有沒有搜索出結果無所謂）
;    3. 在跳轉後的地址欄中找到剛剛輸入的字符，找到剛才搜索的字符並替換成"{q}"（不包括引號），得到搜索鏈接（替換後地址欄上的所有字符）

; - 可以使用 " ->search " 來添加一條設置到[QSearch]

; - 可以在鍵名的右邊加上 （0~n個空格）<xxx> 來作為備註提示

[QSearch]

default=https://www.baidu.com/s?wd={q}
bd=https://www.baidu.com/s?wd={q}
g   <google>=https://www.google.com/search?q={q}
tb  <taobao>=http://s.taobao.com/search?q={q}
wk=https://zh.wikipedia.org/w/index.php?search={q}
m=https://developer.mozilla.org/zh-CN/search?q={q}


;----------------------------------------------------------------
; ## Qbar 快速打開文件（文件夾）設置

; - 在這裡添加一條設置後，就可以在 Qbar 用鍵名快速打開對應鍵值設置的文件或文件夾，例如：
;        這裡設置了"exp=E:\expFolder\example.exe"，在 Qbar 輸入"exp"，回車後會打開"E:\expFolder\example.exe"這個文件

; - 可以通過 Qbar 的 " -> " 指令快速添加一項設置，例如：在 Qbar 輸入"exp2 -> E:\expFolder2\example2.exe"（" -> "兩邊各有一個空格），確認後將會在這裡添加一項"exp2=E:\expFolder2\example2.exe"

; - 如果 " -> " 無法正確識別文件路徑而把設置記錄到了[QWeb]或[TabHotString]，可以使用 " ->run " 來強制記錄到[QRun]

; - 選中文件（文件夾）後，按 +Q ，可以將路徑填入 Qbar ，那麼，你想記錄一個文件來快速打開，就可以這麼操作：
;       1. 選中該文件
;       2. 按下 Capslock+Q，彈出的輸入框內自動填入了該文件的路徑
;       3. 在路徑的最前面加上"xxx -> "
;       4. 按下 Enter 鍵，確認記錄

; - 可以在鍵名的右邊加上 （0~n個空格）<xxx> 來作為備註提示

; - 可以設置以管理員啟動程序，以及啟動程序的參數，
;   需要設置的話程序路徑需要用 " （引號）引起來，左邊加上 *RunAs 將用管理員權限啟動，右邊帶上啟動參數

[QRun]
;一般狀態
ie1=C:\Program Files\Internet Explorer\iexplore.exe

;管理員權限打開
ie2=*runas "C:\Program Files\Internet Explorer\iexplore.exe"

;全屏打開
ie3 <full screen>="C:\Program Files\Internet Explorer\iexplore.exe" -k

;管理員權限，全屏打開
ie4=*runas "C:\Program Files\Internet Explorer\iexplore.exe" -k



;----------------------------------------------------------------
; ## Qbar 快速打開網頁設置

; - 在這裡添加一條設置後，可以在 Qbar 用鍵名快速打開對應鍵值設置的鏈接，例如：
;        這裡設置了"cldocs=https://capslox.com/capslock-plus"，在 Qbar 輸入"cldocs"，回車後會用默認瀏覽器打開"https://capslox.com/capslock-plus"

; - 可以通過 Qbar 的 " -> " 指令快速添加一項設置，例如：在 Qbar 輸入"cl+ -> https://capslox.com/capslock-plus"（" -> "兩邊各有一個空格），確認後將會在這裡添加一項"cl+=https://capslox.com/capslock-plus"

; - 如果 " -> " 無法正確識別網址而把設置記錄到了[QRun]或[TabHotString]，可以使用 " ->web " 來強制記錄到[QWeb]

; - 選中網址後，按 +Q ，可以將網址填入 Qbar ，那麼，你想記錄一個網址來快速打開，就可以這麼操作：
;       1. 選中該網址
;       2. 按下 Capslock+Q，彈出的輸入框內自動填入了該網址
;       3. 在路徑的最前面加上"xxx -> "
;       4. 按下 Enter 鍵，確認記錄

; - 可以在鍵名的右邊加上 （0~n個空格）<xxx> 來作為備註提示

[QWeb]
cldocs=https://capslox.com/capslock-plus



;----------------------------------------------------------------;
; ## TabScript 的字符替換設置

; - Capslock+Tab會將緊靠光標左邊的匹配某鍵名的字符替換成對應鍵值的字符，例如：
;        這裡設置了"@=capslock-plus@cjkis.me"，在任意地方輸入"@"，然後按下"Capslock+Tab"，"@"將替換成"capslock-plus@cjkis.me"

; - 這裡的優先級高於CapsLock+Tab的計算功能，例如：
;        這裡設置了1+1=3，那麼輸入1+1後CapsLock+Tab，1+1會被替換成3而不是2

; - 可以通過 Qbar 的 " -> " 指令快速添加一項設置，例如：在 Qbar 輸入 "tel -> 15012345678" ，確認後將會在這裡添加一項 "tel=15012345678"

; - 如果作為鍵值的字符串是類似網址或文件（夾）路徑的格式，例如："ccc -> com.com.com"， " -> " 指令很可能會將它判定為網址或文件（夾）而把設置記錄到了[QRun]或[QWeb]，可以使用 " ->str " 來強制記錄到[TabHotString]

; - 選中文字後，按 +Q ，可以將文字填入 Qbar ，那麼，你想記錄一段文字，就可以這麼操作：
;       1. 選中該文字
;       2. 按下 Capslock+Q，彈出的輸入框內自動填入了該文字
;       3. 在路徑的最前面加上"xxx -> "
;       4. 按下 Enter 鍵，確認記錄

[TabHotString]
clp=capslockplus

;----------------------------------------------------------------
; ## Qbar 的樣式設置

[QStyle]
;邊框顏色
;指定16種HTML基礎顏色之一或6位的RGB顏色值(0x前綴可以省略)。例如：red、ffffaa、FFFFAA、0xFFFFAA。下面的顏色設置也一樣。
borderBackgroundColor=red

;邊框四角的圓角程度，0為直角
borderRadius=9

;文字輸入框背景顏色
textBackgroundColor=green

;輸入文字顏色
textColor=ffffff

;輸入文字字體
;editFontName=Consolas bold
textFontName=Hiragino Sans GB W6

;輸入文字大小
textFontSize=12

;提示列表字體
listFontName=consolas

;提示列表字體大小
listFontSize=10

;提示列表背景顏色
listBackgroundColor=blue

;提示列表文字顏色
listColor=0x000000

;提示列表行數
listCount=5

;提示列表每行高度
lineHeight=19

;進度條顏色
progressColor=0x00cc99

;----------------------------------------------------------------;
; ## +T翻譯設置

[TTranslate]
;有道api接口
;翻譯功能通過調用有道的api實現。

;收費版api申請網址: https://ai.youdao.com/console/#/
;有道翻譯 API 入門指南: https://ai.youdao.com/doc.s#guide

;翻譯 API 類型，目前只能為 1
;0: 免費版有道 API（已不可使用，有道翻譯不再提供）
;1: 收費版有道 API（默認值）
apiType=1

;收費版申請的參數

;應用ID
appPaidID=xxx

;應用密鑰
appPaidKey=xxx

;曾經 Capslock+ 可以選擇使用免費版或收費版的有道 API 來提供翻譯功能，現在有道已經不再提供免費版 API，
;只能使用收費版的 API，以下與免費版 API 相關的參數已經廢棄，如果你的設置文件中有使用，請刪除掉。
;apiKey=xxx
;keyFrom=xxx

;----------------------------------------------------------------;

)

lang_settingsDemoFileContent_2=
(
; ## 按鍵功能設置

; - 可設置的按鍵組合有：
;   Capslock + F1~F12
;   Capslock + 0~9
;   Capslock + a~z
;   Capslock + `-=[]\;',./ 
;   Capslock + Backspace, Tab, Enter, Space, RAlt
;   Capslock + LALt + F1~F12
;   Capslock + LALt + 0~9
;   Capslock + LALt + a~z
;   Capslock + LALt + `-=[]\;',./ 
;   Capslock + LALt + Backspace, Tab, Enter, Space, RAlt
;   Capslock + Win + 0~9

; - 以下設置鍵名是按鍵組合名，鍵值是對應功能，所有支持的功能都在下面

[Keys]
;短按 Caps Lock -> 發送 Esc
;press_caps=keyFunc_esc

;短按 Caps Lock -> 切換大小寫
press_caps=keyFunc_toggleCapsLock

;Capslock+A -> 光標向左移動一個單詞
caps_a=keyFunc_moveWordLeft

;Capslock+B -> 光標向下移動 10 行
caps_b=keyFunc_moveDown(10)

;獨立剪貼板 1 的複製
caps_c=keyFunc_copy_1

;光標向下移動
caps_d=keyFunc_moveDown

;光標向上移動
caps_e=keyFunc_moveUp

;光標向右移動
caps_f=keyFunc_moveRight

;光標向右移動一個單詞
caps_g=keyFunc_moveWordRight

;向左選中一個單詞
caps_h=keyFunc_selectWordLeft

;向上選中
caps_i=keyFunc_selectUp

;向左選中
caps_j=keyFunc_selectLeft

;向下選中
caps_k=keyFunc_selectDown

;向右選中
caps_l=keyFunc_selectRight

;向下選中 10 行
caps_m=keyFunc_selectDown(10)

;向右選中一個單詞
caps_n=keyFunc_selectWordRight

;選中至行末
caps_o=keyFunc_selectEnd

;光標移動到行首
caps_p=keyFunc_home

; QBar
caps_q=keyFunc_qbar

;delete
caps_r=keyFunc_delete

;光標向左移動
caps_s=keyFunc_moveLeft

caps_t=keyFunc_doNothing

;選中至行首
caps_u=keyFunc_selectHome

;獨立剪貼板 1 的黏貼 
caps_v=keyFunc_paste_1

;backspace
caps_w=keyFunc_backspace

;獨立剪貼板 1 的剪切
caps_x=keyFunc_cut_1

;向上選中 10 行
caps_y=keyFunc_selectUp(10)

caps_z=keyFunc_doNothing

caps_backquote=keyFunc_doNothing

;Capslock+0~9 -> 激活綁定窗口 0~9
caps_1=keyFunc_winbind_activate(1)

caps_2=keyFunc_winbind_activate(2)

caps_3=keyFunc_winbind_activate(3)

caps_4=keyFunc_winbind_activate(4)

caps_5=keyFunc_winbind_activate(5)

caps_6=keyFunc_winbind_activate(6)

caps_7=keyFunc_winbind_activate(7)

caps_8=keyFunc_winbind_activate(8)

caps_9=keyFunc_winbind_activate(9)

caps_0=keyFunc_winbind_activate(10)

caps_minus=keyFunc_qbar_upperFolderPath

caps_equal=keyFunc_qbar_lowerFolderPath

;刪除光標所在一行
caps_backspace=keyFunc_deleteLine

;TabScript
caps_tab=keyFunc_tabScript

;刪除至行首
caps_leftSquareBracket=keyFunc_deleteToLineBeginning

caps_rightSquareBracket=keyFunc_doNothing

caps_backslash=keyFunc_doNothing

;Capslock+; -> end
caps_semicolon=keyFunc_end

caps_quote=keyFunc_doNothing

;換行——無論光標是否在行末
caps_enter=keyFunc_enterWherever

;選中當前單詞
caps_comma=keyFunc_selectCurrentWord

;向右選中單詞
caps_dot=keyFunc_selectWordRight

;刪除至行尾
caps_slash=keyFunc_deleteToLineEnd

;Capslock+Space -> enter
caps_space=keyFunc_enter

;Capslock+RAlt -> 無
caps_right_alt=keyFunc_doNothing

;打開 Capslock+ 首頁
caps_f1=keyFunc_openCpasDocs

;Math Board
caps_f2=keyFunc_mathBoard

;有道翻譯
caps_f3=keyFunc_translate

;窗口透明
caps_f4=keyFunc_winTransparent

;重載 Capslock+
caps_f5=keyFunc_reload

;窗口置頂
caps_f6=keyFunc_winPin

caps_f7=keyFunc_doNothing

caps_f8=keyFunc_getJSEvalString

caps_f9=keyFunc_doNothing

caps_f10=keyFunc_doNothing

caps_f11=keyFunc_doNothing

;打開 / 關閉獨立剪貼板
caps_f12=keyFunc_switchClipboard

;--------------------LAlt--------------------

;Capslock+LAlt+A -> 向左移 3 個單詞
caps_lalt_a=keyFunc_moveWordLeft(3)

;下移 30 次
caps_lalt_b=keyFunc_moveDown(30)

;獨立剪貼板 2 的複製
caps_lalt_c=keyFunc_copy_2

;下移 3 次
caps_lalt_d=keyFunc_moveDown(3)

;上移 3 次
caps_lalt_e=keyFunc_moveUp(3)

;右移 5 次
caps_lalt_f=keyFunc_moveRight(5)

;右移 3 個單詞
caps_lalt_g=keyFunc_moveWordRight(3)

;向左選中 3 個單詞
caps_lalt_h=keyFunc_selectWordLeft(3)

;向上選中 3 次
caps_lalt_i=keyFunc_selectUp(3)

;向左選中 5 個字符
caps_lalt_j=keyFunc_selectLeft(5)

;向下選中 3 次
caps_lalt_k=keyFunc_selectDown(3)

;向右選中 5 個字符
caps_lalt_l=keyFunc_selectRight(5)

;向下選中 30 次
caps_lalt_m=keyFunc_selectDown(30)

;向右選中 3 個單詞
caps_lalt_n=keyFunc_selectWordRight(3)

;選中至頁尾
caps_lalt_o=keyFunc_selectToPageEnd

;移動至頁首
caps_lalt_p=keyFunc_moveToPageBeginning

caps_lalt_q=keyFunc_doNothing

;向前刪除單詞
caps_lalt_r=keyFunc_forwardDeleteWord

;左移 5 次
caps_lalt_s=keyFunc_moveLeft(5)

;上移 30 次
caps_lalt_t=keyFunc_moveUp(30)

;選中至頁首
caps_lalt_u=keyFunc_selectToPageBeginning

;獨立剪貼板 2 的黏貼
caps_lalt_v=keyFunc_paste_2

;刪除單詞
caps_lalt_w=keyFunc_deleteWord

;獨立剪貼板 2 的 剪切
caps_lalt_x=keyFunc_cut_2

;向上選中 30 次
caps_lalt_y=keyFunc_selectUp(30)

caps_lalt_z=keyFunc_doNothing

caps_lalt_backquote=keyFunc_doNothing

caps_lalt_1=keyFunc_winbind_binding(1)

caps_lalt_2=keyFunc_winbind_binding(2)

caps_lalt_3=keyFunc_winbind_binding(3)

caps_lalt_4=keyFunc_winbind_binding(4)

caps_lalt_5=keyFunc_winbind_binding(5)

caps_lalt_6=keyFunc_winbind_binding(6)

caps_lalt_7=keyFunc_winbind_binding(7)

caps_lalt_8=keyFunc_winbind_binding(8)

caps_lalt_9=keyFunc_winbind_binding(9)

caps_lalt_0=keyFunc_winbind_binding(10)

caps_lalt_minus=keyFunc_doNothing

caps_lalt_equal=keyFunc_doNothing

;刪除全部
caps_lalt_backspace=keyFunc_deleteAll

caps_lalt_tab=keyFunc_doNothing

;刪除至頁首
caps_lalt_leftSquareBracket=keyFunc_deleteToPageBeginning

;Capslock+LAlt+]
caps_lalt_rightSquareBracket=keyFunc_doNothing

;Capslock+LAlt+\
caps_lalt_backslash=keyFunc_doNothing

;移動至頁尾
caps_lalt_semicolon=keyFunc_moveToPageEnd

caps_lalt_quote=keyFunc_doNothing

caps_lalt_enter=keyFunc_doNothing

;選中當前行
caps_lalt_comma=caps_comma=keyFunc_selectCurrentLine

;向右選中 3 個單詞
caps_lalt_dot=keyFunc_selectWordRight(3)

;刪除至頁尾
caps_lalt_slash=keyFunc_deleteToPageEnd

caps_lalt_space=keyFunc_doNothing

caps_lalt_ralt=keyFunc_doNothing

caps_lalt_f1=keyFunc_doNothing

caps_lalt_f2=keyFunc_doNothing

caps_lalt_f3=keyFunc_doNothing

caps_lalt_f4=keyFunc_doNothing

caps_lalt_f5=keyFunc_doNothing

caps_lalt_f6=keyFunc_doNothing

caps_lalt_f7=keyFunc_doNothing

caps_lalt_f8=keyFunc_doNothing

caps_lalt_f9=keyFunc_doNothing

caps_lalt_f10=keyFunc_doNothing

caps_lalt_f11=keyFunc_doNothing

caps_lalt_f12=keyFunc_doNothing

caps_lalt_wheelUp=keyFunc_doNothing

caps_lalt_wheelDown=keyFunc_doNothing

; CapsLock + Windows + 0~9 -> 綁定窗口 0~9
caps_win_1=keyFunc_winbind_binding(1)

caps_win_2=keyFunc_winbind_binding(2)

caps_win_3=keyFunc_winbind_binding(3)

caps_win_4=keyFunc_winbind_binding(4)

caps_win_5=keyFunc_winbind_binding(5)

caps_win_6=keyFunc_winbind_binding(6)

caps_win_7=keyFunc_winbind_binding(7)

caps_win_8=keyFunc_winbind_binding(8)

caps_win_9=keyFunc_winbind_binding(9)

caps_win_0=keyFunc_winbind_binding(10)


;----------------其他功能----------------

;上一首
keyFunc_mediaPrev

;暫停 / 播放
keyFunc_mediaPlayPause

;音量增大
keyFunc_volumeUp

;音量減小
keyFunc_volumeDown

;靜音
keyFunc_volumeMute

; 鼠標左鍵點擊
keyfunc_click_left

; 鼠標右鍵點擊
keyfunc_click_right

; 移動鼠標（長按可加快移動速度）
keyfunc_mouse_up

keyfunc_mouse_down

keyfunc_mouse_left

keyfunc_mouse_right

; 滾輪上滑
keyfunc_wheel_up

; 滾輪下滑
keyfunc_wheel_down

)
global lang_winsInfosRecorderIniInit:=""
lang_winsInfosRecorderIniInit=
(
;------------ Encoding: UTF-16 ------------
;這裡記錄著窗口的數據，不要手動修改本文件內容，點下右上角的"X"就好。

[0]
bindType=
class_0=
exe_0=
id_0=
[1]
bindType=
class_0=
exe_0=
id_0=
[2]
bindType=
class_0=
exe_0=
id_0=
[3]
bindType=
class_0=
exe_0=
id_0=
[4]
bindType=
class_0=
exe_0=
id_0=
[5]
bindType=
class_0=
exe_0=
id_0=
[6]
bindType=
class_0=
exe_0=
id_0=
[7]
bindType=
class_0=
exe_0=
id_0=
[8]
bindType=
class_0=
exe_0=
id_0=
)

; keysFunction.ahk
global lang_kf_getDebugText:=""
lang_kf_getDebugText=
(
供 TabScript 調試用字符串
點擊"OK"將它複製到剪貼板
)
return
