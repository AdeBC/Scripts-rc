set ts=4
set noexpandtab
%retab!
set nocompatible
set number
filetype on
set history=1000
colorscheme monokai
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set nohls
set incsearch
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
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
