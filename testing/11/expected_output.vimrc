" This test is designed to test direct reductive commenting and uncommenting of
" blocks of text

This line should stay commented uncommented

" This line should stay commented

" EPIGEN_DEL_BLOCK_TEST ACTIVE {

" This block should become commented
" ....

" This bracket } should not brake it

" EPIGEN_DEL_BLOCK_TEST }

" EPIGEN_DEL_BLOCK_TEST2 {
" " EPIGEN_DEL_BLOCK_TEST ACTIVE {

" " " This block should stay commented
" " " ....

" " " This bracket } should not brake it

" " EPIGEN_DEL_BLOCK_TEST }
" EPIGEN_DEL_BLOCK_TEST2 }

" EPIGEN_DEL_BLOCK_TEST ACTIVE {
" " EPIGEN_DEL_BLOCK_TEST2 {

" " This block should become commented even more
" " ....

" " This bracket } should not brake it

" " EPIGEN_DEL_BLOCK_TEST2 }
" EPIGEN_DEL_BLOCK_TEST }
