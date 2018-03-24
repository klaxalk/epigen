" This test is designed to test activation of nested lines and blocks
" using the reduction mode (sequential)

" This line should stay commented

This line should stay uncommented

" This line should become uncommented " EPIGEN_LINE_TEST DEACTIVATED

This line should stay uncommented " EPIGEN_LINE_TEST ACTIVE

" EPIGEN_BLOCK_TEST DEACTIVATED {

" This block should become uncommented
" ....

" This bracket } should not brake it

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST DEACTIVATED {

" This line should become uncomemmented

" " EPIGEN_BLOCK_TEST2 DEACTIVATED {

" " This block should become uncommented
" " ....

" " This bracket } should not brake it

" " " this lineshould become completely uncommented " EPIGEN_LINE_TEST3 DEACTIVATED

" " EPIGEN_BLOCK_TEST2 }

" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST DEACTIVATED {
" this is a short block which will be uncomemmented
" EPIGEN_BLOCK_TEST }

" EPIGEN_BLOCK_TEST2 DEACTIVATED {
" " this line should become completely uncommented " EPIGEN_LINE_TEST DEACTIVATED
" EPIGEN_BLOCK_TEST2 }
