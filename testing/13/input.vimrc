" This test is designed to test mass deactivation of
" lines and blocks in reductive mode

" This line should stay commented

This line should stay uncommented

" This line should become uncommented " EPIGEN_LINE_TEST DEACTIVATED

This line should stay uncommented " EPIGEN_LINE_TEST

" EPIGEN_BLOCK_TEST DEACTIVATED {

" This block should become uncommented
" ....

" This bracket } should not brake it

" EPIGEN_BLOCK_TEST }


" EPIGEN_BLOCK_TEST DEACTIVATED {

" This line should become uncommented

" " EPIGEN_BLOCK_TEST2 {

" " This block should become less commented
" " ....

" " This bracket } should not brake it

" " EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST DEACTIVATED {
" this is a short block which was commented
" EPIGEN_BLOCK_TEST }
