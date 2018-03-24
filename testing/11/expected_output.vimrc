" This test is designed to test direct reductive commenting and uncommenting of
" blocks of text

This line should stay commented uncommented

" This line should stay commented

" EPIGEN_BLOCK_TEST DEACTIVATED {

" This block should become commented
" ....

" This bracket } should not brake it

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST2 {
" " EPIGEN_BLOCK_TEST {

" " This block should stay commented
" " ....

" " This bracket } should not brake it

" " EPIGEN_BLOCK_TEST }
" EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST DEACTIVATED {
" " EPIGEN_BLOCK_TEST2 {

" " This block should become commented even more
" " ....

" " This bracket } should not brake it

" " EPIGEN_BLOCK_TEST2 }
" EPIGEN_BLOCK_TEST }
