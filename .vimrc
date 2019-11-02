set ts=4
set noexpandtab
set mouse=a " 支持使用鼠标
%retab!
set nocompatible " 不与vi兼容
set number " 显示行号
filetype on
set history=1000
colorscheme monokai " 设置主题
syntax on " 打开语法高亮
set autoindent " 自动缩进，按下回车保持缩进
set smartindent
set softtabstop=4 " tab转换为4个空格
set shiftwidth=4
set showmatch " 光标遇到括号时自动高亮显示另一半
set guioptions-=T
set vb t_vb=
set ruler "在状态栏显示光标的当前位置
set nohls
set incsearch " 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set undofile " 保留编辑历史
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8 " 文件编码使用utf-8
set paste # 粘贴模式
set clipboard=unnamed # 使用系统剪贴板
set backupdir=~/.vim/.backup// " 设置备份文件、交换文件、操作历史文件的保存路径  
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo// 

if has("vms")
set nobackup
else
set backup
endif
"进行版权声明的设置
""添加或更新头
map <F4> :call TitleDet() <cr>'s
function AddTitle()
	call append(0,"'''")
	call append(1,"************************************************************")
	call append(2,"Author        : Hui Chong")
	call append(3,"Email         : ch37915405887@gmail.com.com")
	call append(4,"Last modified : ".strftime("%Y-%m-%d %H:%M"))
	call append(5,"Filename      : ".expand("%:t"))
	call append(6,"Description   : Empty")
	call append(7,"************************************************************")
	call append(8,"'''")
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

"更新最近修改时间和文件名
function UpdateTitle()
	normal m'
	execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
	normal ''
	normal mk										  
	execute	'/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
	execute	"noh"								
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copy right | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()		
	let n = 1
	"默认为添加
	while n < 9
		let line = getline(n)
		if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n+1
	endwhile
	call AddTitle()
endfunction
