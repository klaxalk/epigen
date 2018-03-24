" This test is designed to test mass deactivation of
" lines and blocks in reductive mode

" This line should stay commented

This line should stay uncommented

" This line should become uncommented " EPIGEN_DEL_LINE_TEST ACTIVE

This line should stay uncommented " EPIGEN_DEL_LINE_TEST

" EPIGEN_DEL_BLOCK_TEST ACTIVE {

" This block should become uncommented
" ....

" This bracket } should not brake it

" EPIGEN_DEL_BLOCK_TEST }


" EPIGEN_DEL_BLOCK_TEST ACTIVE {

" This line should become uncommented

" " EPIGEN_DEL_BLOCK_TEST2 {

" " This block should become less commented
" " ....

" " This bracket } should not brake it

" " EPIGEN_DEL_BLOCK_TEST2 }

" EPIGEN_DEL_BLOCK_TEST }

" EPIGEN_DEL_BLOCK_TEST ACTIVE {
" this is a short block which was commented
" EPIGEN_DEL_BLOCK_TEST }
