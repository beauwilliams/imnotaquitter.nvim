if exists('g:loaded_imnotaquitter')
  finish
endif

let g:loaded_imnotaquitter = 1


"A vim best-practice
let s:save_cpo = &cpo
set cpo&vim

function! Randnum(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction


function! Affirmation()
    let index = Randnum(14)
    let affirmations = [
                \"I am not a quitter.",
                \"I can do this. I will never quit Vim. End of story.",
                \"I am enough. I am whole. I will never quit Vim.",
                \"I don’t sweat the small stuff. Nor do I exit Vim.",
                \"I am adventurous. I overcome fears by following my dreams. My dream is to never quit Vim.",
                \"Chuck Norris doesn't quit Vim so neither will I",
                \"Roses are red, violets are blue, I don't quit Vim, so neither will you.\n - Ghandi",
                \"Some people flex with money, I flex by never quitting Vim.",
                \"Stuck inside Vim? Don't worry, this plugin won't let you leave anyway.",
                \"I've been stuck inside Vim for 7 years and 46 days.",
                \"I will not give in.",
                \"True strength comes from within. (and from not quitting Vim)",
                \"I'm not stuck in Vim, I'm simply confined through my awe of its beauty.",
                \"A friend once told me that Emacs is better than Vim. I ate his liver with some fava beans and a nice chianti.",
                \]
    return affirmations[index]
endfunction

function! ImNotAQuitter()
      if (confirm(Affirmation(), "&Okay", 1)!=1)
        return v:false
      endif
endfunction

cnoreabbrev <expr> q (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> q! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qu (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qu! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quit (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quit! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qa (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qa! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qall (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> qall! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quitall (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> quitall! (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> wq (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> wq! (ImNotAQuitter()) ? '' : 'w!'
cnoreabbrev <expr> wqa (ImNotAQuitter()) ? '' : 'wa'
cnoreabbrev <expr> wqa! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> wqall (ImNotAQuitter()) ? '' : 'wa'
cnoreabbrev <expr> wqall! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> x (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> exit (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> xit (ImNotAQuitter()) ? '' : 'w'
cnoreabbrev <expr> x! (ImNotAQuitter()) ? '' : 'w!'
cnoreabbrev <expr> xall! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> xa! (ImNotAQuitter()) ? '' : 'wa!'
cnoreabbrev <expr> cq (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> :q (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> vim.cmd'q' (ImNotAQuitter()) ? '' : ''
cnoreabbrev <expr> execute('q') (ImNotAQuitter()) ? '' : ''
map ZZ <cmd> call ImNotAQuitter()<cr> <bar> <cmd>w<cr>
map ZQ <cmd> call ImNotAQuitter()<cr>
command! -bang LETMEOUTOFHERE qall<bang>

nmap <c-z> <cmd> call ImNotAQuitter()<cr>
xmap <c-z> <cmd> call ImNotAQuitter()<cr>
vmap <c-z> <cmd> call ImNotAQuitter()<cr>
cmap <c-z> <cmd> call ImNotAQuitter()<cr>

augroup Im_Not_A_Quitter
  autocmd!
  autocmd CmdlineEnter : let s:isk_save = &l:iskeyword | setlocal iskeyword+=!
  autocmd CmdlineLeave : let &l:iskeyword = s:isk_save
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
