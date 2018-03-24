" This test is designed to test direct additive commenting and uncommenting of
" blocks of text

" This line should stay commented

" EPIGEN_ADD_BLOCK_TEST ACTIVE {

This block should become commented
....

This bracket } should not brake it

" EPIGEN_ADD_BLOCK_TEST2 {
" " EPIGEN_ADD_BLOCK_TEST3 {

" " This block should stay commented
" " ....

" " This bracket } should not brake it

" " EPIGEN_ADD_BLOCK_TEST3 }
" EPIGEN_ADD_BLOCK_TEST2 }

" EPIGEN_ADD_BLOCK_TEST }


" EPIGEN_ADD_BLOCK_TEST2 {
" " EPIGEN_ADD_BLOCK_TEST {

" " This block should stay commented
" " ....

" " This bracket } should not brake it

" " EPIGEN_ADD_BLOCK_TEST }
" EPIGEN_ADD_BLOCK_TEST2 }
