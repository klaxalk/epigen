" This test is designed to test direct reductive commenting and uncommenting of
" blocks of text

" This line should stay commented

" EPIGEN_BLOCK_TEST {

This block should become uncommented
....

This bracket } should not brake it

" EPIGEN_BLOCK_TEST2 {
" " EPIGEN_BLOCK_TEST3 {

" " This block should stay commented
" " ....

" " This bracket } should not brake it

" " EPIGEN_BLOCK_TEST3 }
" EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST2 DEACTIVATED {
" " EPIGEN_BLOCK_TEST {

" " This block should stay as it is
" " ....

" " This bracket } should not brake it

" " EPIGEN_BLOCK_TEST }
" EPIGEN_BLOCK_TEST2 }
